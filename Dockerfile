# FROM nvcr.io/nvidia/l4t-base:r35.2.1 

FROM ubuntu:20.04

RUN apt update

RUN apt-get install libssl-dev build-essential libtool autoconf unzip wget -y

RUN mkdir ~/temp
RUN cd ~/temp
# RUN wget https://cmake.org/files/v3.21/cmake-3.21.4.tar.gz
# RUN tar -xzvf cmake-3.21.4.tar.gz
# RUN cd cmake-3.21.4/
# RUN apt-get -y install gcc mono-mcs && \
#     rm -rf /var/lib/apt/lists/*
# RUN ./bootstrap
# RUN make -j4
# RUN make install
RUN apt-get -y install cmake
RUN cmake --version
RUN cd ~
RUN rm -rf ~/temp

RUN apt-get install libprotobuf-dev protobuf-compiler libvulkan-dev
RUN git clone --depth=1 https://github.com/Tencent/ncnn.git
RUN cd ncnn
RUN git submodule update --depth=1 --init
RUN mkdir build
RUN cd build
RUN cmake -D CMAKE_TOOLCHAIN_FILE=../toolchains/jetson.toolchain.cmake \
        -D NCNN_DISABLE_RTTI=OFF \
        -D NCNN_BUILD_TOOLS=ON \
        -D NCNN_VULKAN=ON \
        -D CMAKE_BUILD_TYPE=Release ..
RUN make -j4
RUN make install
RUN mkdir /usr/local/lib/ncnn
RUN cp -r install/include/ncnn /usr/local/include/ncnn
RUN cp -r install/lib/*.a /usr/local/lib/ncnn/
RUN cd ~
RUN rm -rf ncnn


