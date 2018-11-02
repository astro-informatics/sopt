FROM ubuntu:18.10

USER root
WORKDIR /build

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget cmake  g++ zsh && \
  apt-get install -y libopenmpi3 libtiff5-dev libgomp1 libfftw3-dev libboost-all-dev libeigen3-dev

ENV LD_LIBRARY_PATH /usr/local/lib

# Build sopt
RUN git clone https://github.com/astro-informatics/sopt.git
RUN mkdir -p /build/sopt/build && cd /build/sopt/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release \
    -Dtests=ON \
    -Dexamples=OFF \
    -Dbenchmarks=OFF \
    -DMPIEXEC:FILEPATH=$(which mpirun) -DMPIEXEC_MAX_NUMPROCS=4 \
    -DMPIEXEC_PREFLAGS="--oversubscribe" && \
    make && make install

RUN useradd -ms /bin/bash purifier

USER purifier
ENV HOME /home/purifier
WORKDIR /mydata
CMD ["zsh"]

