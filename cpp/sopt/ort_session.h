#ifndef SOPT_ORT_SESSION_H
#define SOPT_ORT_SESSION_H

#include "onnxruntime_cxx_api.h"
#include "sopt/logging.h"
#include "sopt/utilities.h"
#include "sopt/types.h"

#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace sopt {

/// @brief Sopt interface class to hold a ONNXrt session
class ORTsession {

  public:

  ORTsession() = delete;

  /// Constructor
  ORTsession(const std::string& filename, const std::string& runname = "soptONNXrt") {

    // Set-up ONNXrt session
    _env = std::make_unique<Ort::Env>(ORT_LOGGING_LEVEL_WARNING, runname.c_str());

    // Load the model
    Ort::SessionOptions sessionopts;
    _session = std::make_unique<Ort::Session>(*_env, filename.c_str(), sessionopts);

    // Store model hyperparameters (input/output shape etc.)
    _retrieveNetworkInfo();
  }

  /// Evaluates the network in the forward direction
  /// using a flattened tensor as input
  std::vector<float> compute(std::vector<float>& inputs, const std::vector<int64_t>& inDims) const {

    if (inputs.empty()) {
      throw std::length_error("Input vector is empty!");
    }
    if (inDims.size() != _inShape) {
      throw std::length_error("Input tensor has incorrect shape! Expected "+std::to_string(_inShape)+" dimensions.");
    }

    // reshape flat input vector as tensor and run the model
    auto memory_info = Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);
    auto input_tensor = Ort::Value::CreateTensor<float>(memory_info, inputs.data(), inputs.size(),
                                                        inDims.data(), inDims.size());
    auto output_tensors = _session->Run(Ort::RunOptions{nullptr}, _inNames.data(),
                                        &input_tensor, _inNames.size(),
                                        _outNames.data(), _outNames.size());

    // retrieve the ouput tensor and return flattened version
    auto outputInfo = output_tensors[0].GetTensorTypeAndShapeInfo();
    // Fix negative shape values - this appears to be an artefact of batch size issues
    int64_t outLen = 1;
    for (auto& dim : outputInfo.GetShape()) {
      if (dim < 0)  dim = abs(dim);
      outLen *= dim;
    }
    if (outLen == 0) {
      throw std::length_error("Invalid network structure: Output node with 0-length tensor encountered!");
    }
    float* floatarr = output_tensors.front().GetTensorMutableData<float>();
    std::vector<float> outputs;
    outputs.assign(floatarr, floatarr + outLen);
    return outputs;
  }

  /// Variant of compute() using input/output Eigen arrays
  template<typename T = t_real>
  Vector<T> compute(const Vector<T>& input, const std::vector<int64_t>& inDims) const {

    // ONNXrt requires floats as input
    std::vector<float> flat_input(input.size());
    for (size_t i=0; i < input.size(); ++i) {
      flat_input[i] = input[i];
    }
    std::vector<float> flat_output = compute(flat_input, inDims);
    Vector<T> rtn(flat_output.size());
    for (size_t i = 0; i < flat_output.size(); ++i) {
      rtn[i] = flat_output[i];
    }
    return rtn;
  }

  /// Variant of compute() using input/output Image
  template<typename T = t_real>
  Image<T> compute(const Image<T>& input, std::vector<int64_t> inDims = {}) const {

    // require an output node of the form {1, nRows, nCols}
    // in order to be able to map this onto a 2D tensor
    if (inDims.size() && inDims.size() != _inShape) {
      throw std::length_error("Input tensor has incorrect shape! Expected "+std::to_string(_inShape)+" dimensions.");
    }

    // ONNXrt requires floats as input
    const int nrows = input.rows();
    const int ncols = input.cols();
    std::vector<float> flat_input(nrows*ncols);
    for (int i = 0; i < nrows; ++i) {
      for (int j = 0; j < ncols; ++j) {
        flat_input[j*ncols+i] = input(i,j);
      }
    }
    if (inDims.empty()) {
      while (inDims.size() < _inShape-2)  inDims.push_back(1);
      inDims.push_back(nrows);
      inDims.push_back(ncols);
    }
    std::vector<float> flat_output = compute(flat_input, inDims);

    std::vector<T> tResults(flat_output.begin(), flat_output.end());
    Eigen::Map<Eigen::Array<T, Eigen::Dynamic, Eigen::Dynamic>> rtn(tResults.data(), nrows, ncols);
    return rtn;
  }

  /// Method to check if @a key exists in network metadata
  const bool hasKey(const std::string& key) const {
    Ort::AllocatorWithDefaultOptions allocator;
    return  (bool)_metadata->LookupCustomMetadataMapAllocated(key.c_str(), allocator);
  }

  /// Method to retrieve value associated with @a key
  /// from network metadata and return value as type T
  template <typename T>
  const T retrieve(const std::string& key) const {
    Ort::AllocatorWithDefaultOptions allocator;
    Ort::AllocatedStringPtr res = _metadata->LookupCustomMetadataMapAllocated(key.c_str(), allocator);
    if (!res) {
      throw std::runtime_error("Key '"+key+"' not found in network metadata!");
    }
    if constexpr (std::is_same<T, std::string>::value) {
      return res.get();
    }
    else {
      return utilities::lexical_cast<T>(res.get());
    }
  }


  /// Variation of retrieve method that falls back
  /// to @a defaultreturn if @a key cannot be found
  template <typename T>
  const T retrieve(const std::string& key, const T& defaultreturn) const {
    try {
      return retrieve<T>(key);
    } catch (std::exception& e) {
      return defaultreturn;
    }
  }


  private:

  void _retrieveNetworkInfo() {

    Ort::AllocatorWithDefaultOptions allocator;

    // Retrieve network metadata
    _metadata = std::make_unique<Ort::ModelMetadata>(_session->GetModelMetadata());

    // find out how many input nodes the model expects
    const size_t num_input_nodes = _session->GetInputCount();
    if (num_input_nodes == 0) {
      throw std::length_error("Invalid network structure! Expected at least one input node.");
    }
    _inShape = _session->GetInputTypeInfo(0).GetTensorTypeAndShapeInfo().GetShape().size();
    _inNames.reserve(num_input_nodes);
    _inNamesPtr.reserve(num_input_nodes);
    SOPT_DEBUG("ORT input nodes = {}", num_input_nodes);
    for (size_t i = 0; i < num_input_nodes; ++i) {
      // query input node names
      auto input_name = _session->GetInputNameAllocated(i, allocator);
      _inNames.push_back(input_name.get());
      _inNamesPtr.push_back(std::move(input_name));
      SOPT_DEBUG("ORT input node {} is called {}", i, _inNames[_inNames.size()-1]);
    }

    // find out how many output nodes the model provides
    const size_t num_output_nodes = _session->GetOutputCount();
    if (num_output_nodes == 0) {
      throw std::length_error("Invalid network structure! Expected at least one output node.");
    }
    _outNames.reserve(num_output_nodes);
    _outNamesPtr.reserve(num_output_nodes);
    SOPT_DEBUG("ORT output nodes = {}", num_output_nodes);
    for (size_t i = 0; i < num_output_nodes; ++i) {
      // query input node names
      auto output_name = _session->GetOutputNameAllocated(i, allocator);
      _outNames.push_back(output_name.get());
      _outNamesPtr.push_back(std::move(output_name));
      SOPT_DEBUG("ORT output node {} is called {}", i, _outNames[_outNames.size()-1]);

    }
  }

  private:

  /// ONNXrt environment for this session
  std::unique_ptr<Ort::Env> _env;

  /// ONNXrt session holding the network
  std::unique_ptr<Ort::Session> _session;

  /// Network metadata
  std::unique_ptr<Ort::ModelMetadata> _metadata;

  /// Pointers to the ORT input/output node names
  std::vector<Ort::AllocatedStringPtr> _inNamesPtr, _outNamesPtr;

  /// C-style arrays of the input/output node names
  std::vector<const char*> _inNames, _outNames;

  /// Shape of the input/output tensors
  size_t _inShape;

};

} // end of namespace sopt

#endif
