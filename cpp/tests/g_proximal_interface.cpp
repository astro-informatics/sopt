#include <catch.hpp>
#include "sopt/l1_g_proximal.h"
#include "sopt/tf_g_proximal.h"
#include "tools_for_tests/directories.h"

// A simple test that checks the GProximal child classes L1GProximal and TFGProximal
// have everything they need to compile successfully

TEST_CASE("L1 proximal") {

  auto gp = std::make_shared<sopt::algorithm::L1GProximal<double>>(false);
  gp->log_message();
  CHECK(true);
  
}

TEST_CASE("TF proximal") {

  auto gp = std::make_shared<sopt::algorithm::TFGProximal<double>>(sopt::notinstalled::models_directory() + "/DnCNN/snr_15_model.pb/");
  gp->log_message();
  CHECK(true);

}
