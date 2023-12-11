#ifndef SOPT_ORT_SESSION_H
#define SOPT_ORT_SESSION_H

#include "onnxruntime/onnxruntime_cxx_api.h"
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
  std::vector<float> compute(std::vector<float>& inputs) const {

    if (inputs.size() != _inDimsFlat[0]) {
      throw std::length_error("Incorrect size for input tensor! Expected length: " + std::to_string(_inDimsFlat[0]));
    }

    // reshape flat input vector as tensor and run the model
    auto memory_info = Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);
    auto input_tensor = Ort::Value::CreateTensor<float>(memory_info, inputs.data(), inputs.size(),
                                                        _inDims[0].data(), _inDims[0].size());
    auto output_tensors = _session->Run(Ort::RunOptions{nullptr}, _inNames.data(),
                                        &input_tensor, _inNames.size(),
                                        _outNames.data(), _outNames.size());

    // retrieve the ouput tensor and return flattened version
    float* floatarr = output_tensors.front().GetTensorMutableData<float>();
    std::vector<float> outputs;
    outputs.assign(floatarr, floatarr + _outDimsFlat[0]);
    return outputs;
  }

  /// Variant of compute() using input/output Eigen arrays
  template<typename T = t_real>
  Vector<T> compute(const Vector<T>& input) const {

    // require an output note of the form {1, nRows, nCols}
    // in order to be able to map this onto a 2D tensor
    if (_outDims[0].size() < 3) {
      throw std::length_error("Incorrect size for output tensor!");
    }

    std::vector<float> flat_input;
    flat_input.reserve(input.size()); // ONNXrt requires floats as input
    for (auto elem : input) {
      flat_input.push_back(elem);
    }
    std::vector<float> flat_output = compute(flat_input);
    Vector<T> rtn(flat_output.size());
    for (size_t i = 0; i < flat_output.size(); ++i) {
      rtn[i] = flat_output[i];
    }
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
    _inDimsFlat.reserve(num_input_nodes);
    _inTypes.reserve(num_input_nodes);
    _inDims.reserve(num_input_nodes);
    _inNames.reserve(num_input_nodes);
    _inNamesPtr.reserve(num_input_nodes);
    for (size_t i = 0; i < num_input_nodes; ++i) {
      // query input node names
      auto input_name = _session->GetInputNameAllocated(i, allocator);
      _inNames.push_back(input_name.get());
      _inNamesPtr.push_back(std::move(input_name));
      SOPT_DEBUG("ORT input node {} is called {}", i, _inNames[_inNames.size()-1]);

      // query input node types
      auto in_type_info = _session->GetInputTypeInfo(i);
      auto in_tensor_info = in_type_info.GetTensorTypeAndShapeInfo();
      _inTypes.push_back(in_tensor_info.GetElementType());
      _inDims.push_back(in_tensor_info.GetShape());
      SOPT_DEBUG("ORT input node {} has {} dimensions", i, in_tensor_info.GetShape().size());
      for (size_t j=0; j < in_tensor_info.GetShape().size(); ++j) {
        SOPT_DEBUG("\tdimension {} has length {}", j, in_tensor_info.GetShape()[j]);
      }
    }

    // Fix negative shape values - this appears to be an artefact of batch size issues
    for (auto& dims : _inDims) {
      int64_t n = 1;
      for (auto& dim : dims) {
        if (dim < 0)  dim = abs(dim);
        n *= dim;
      }
      _inDimsFlat.push_back(n);
    }
    if (_inDimsFlat[0] == 0) {
      throw std::length_error("Invalid network structure: Input node with 0-length tensor found.");
    }


    // find out how many output nodes the model provides
    const size_t num_output_nodes = _session->GetOutputCount();
    if (num_output_nodes == 0) {
      throw std::length_error("Invalid network structure! Expected at least one output node.");
    }
    _outDimsFlat.reserve(num_output_nodes);
    _outTypes.reserve(num_output_nodes);
    _outDims.reserve(num_output_nodes);
    _outNames.reserve(num_output_nodes);
    _outNamesPtr.reserve(num_output_nodes);
    for (size_t i = 0; i < num_output_nodes; ++i) {
      // query input node names
      auto output_name = _session->GetOutputNameAllocated(i, allocator);
      _outNames.push_back(output_name.get());
      _outNamesPtr.push_back(std::move(output_name));
      SOPT_DEBUG("ORT output node {} is called {}", i, _outNames[_outNames.size()-1]);

      // query output node types
      auto out_type_info = _session->GetOutputTypeInfo(i);
      auto out_tensor_info = out_type_info.GetTensorTypeAndShapeInfo();
      _outTypes.push_back(out_tensor_info.GetElementType());
      _outDims.push_back(out_tensor_info.GetShape());
      SOPT_DEBUG("ORT output node {} has {} dimensions", i, out_tensor_info.GetShape().size());
      for (size_t j=0; j < out_tensor_info.GetShape().size(); ++j) {
        SOPT_DEBUG("\tdimension {} has length {}", j, out_tensor_info.GetShape()[j]);
      }
    }

    // Fix negative shape values - this appears to be an artefact of batch size issues
    for (auto& dims : _outDims) {
      int64_t n = 1;
      for (auto& dim : dims) {
        if (dim < 0)  dim = abs(dim);
        n *= dim;
      }
      _outDimsFlat.push_back(n);
    }
    if (_outDimsFlat[0] == 0) {
      throw std::length_error("Invalid network structure: Output node with 0-length tensor found.");
    }
  }

  private:

  /// ONNXrt environment for this session
  std::unique_ptr<Ort::Env> _env;

  /// ONNXrt session holding the network
  std::unique_ptr<Ort::Session> _session;

  /// Network metadata
  std::unique_ptr<Ort::ModelMetadata> _metadata;

  /// Input and output node dimensions
  ///
  /// @note Each node could be a multidimensional tensor
  std::vector<std::vector<int64_t>> _inDims, _outDims;

  /// Equivalent length for flattened input/output node structure
  std::vector<int64_t> _inDimsFlat, _outDimsFlat;

  /// Types of the input/output nodes (as ONNX enum)
  std::vector<ONNXTensorElementDataType> _inTypes, _outTypes;

  /// Pointers to the ORT input/output node names
  std::vector<Ort::AllocatedStringPtr> _inNamesPtr, _outNamesPtr;

  /// C-style arrays of the input/output node names
  std::vector<const char*> _inNames, _outNames;

};

} // end of namespace sopt

#endif
