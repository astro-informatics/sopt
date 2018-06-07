#!/bin/bash

if [[ $DEBUG == True ]]; then
    set -x # This prints out all the commands
fi

## Install latest cmake

sudo add-apt-repository -y ppa:george-edison55/cmake-3.x
sudo apt-get update
sudo apt-get install cmake


## Install gcc7

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update
sudo apt-get install -y gcc-snapshot gcc-7 g++-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 \
     --slave /usr/bin/g++ g++ /usr/bin/g++-7


echo ${TRAVIS_OS_NAME}
set +x
