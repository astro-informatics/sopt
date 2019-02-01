FROM uclrits/cppdev:18.10

USER root
WORKDIR /build
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
RUN cp /etc/zsh/newuser.zshrc.recommended /home/purifier/.zshrc
WORKDIR /mydata
CMD ["zsh"]

# docker build -t uclrits/sopt:18.10
