#include "sopt/utilities.h"
#include <Eigen/Core>
#include <vector>
#include "sopt/types.h"
#include <cppflow/cppflow.h>
#include "cppflow/ops.h"
#include "cppflow/model.h"

namespace sopt {
namespace cppflowutils {
    cppflow::tensor convert_image_to_tensor(Image<> const &image){
    int const image_rows = image.rows();
    int const image_cols = image.cols();
    std::vector<int64_t> input_shape = {image_rows, image_cols};

    // create a vector of the right size
    std::vector<float> input_values(image_rows*image_cols, 1);
    for (int i = 0; i < image.rows(); ++i) {
        for (int j = 0; j < image.cols(); ++j) {
        input_values[j*image_cols+i] = image(i,j);
        }
    }
    
    // create a tensor from vector
    cppflow::tensor input_tensor(input_values, input_shape);
    
    // Add batch dimension at start and extra dimension at end??
    // cppflow::decode_jpeg results in a shape (rows, cols, 1) so we assume this is needed
    input_tensor = cppflow::expand_dims(input_tensor, 0);
    input_tensor = cppflow::expand_dims(input_tensor, -1);

    return input_tensor;
    }

}  // namespace cppflowutils
}  // namespace sopt