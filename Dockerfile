FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install git golang-go \
    pkg-config protobuf-compiler=3.0.0-9.1ubuntu1 clang=1:6.0-41~exp5~ubuntu1 \
    clang-6.0=1:6.0-1ubuntu2 libcurl4-openssl-dev=7.58.0-2ubuntu3.5 ccache \
    icecc \
    python-dev=2.7.15~rc1-1 \
    libprotobuf-dev=3.0.0-9.1ubuntu1 libssl-dev=1.1.0g-2ubuntu4.3 wget && \
    mkdir -p /opt/source/xts-rippled && cd /opt/source && \
    wget https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz && \
    tar xvzf boost_1_67_0.tar.gz && cd boost_1_67_0 && ./bootstrap.sh && \
    ./b2 -j 4 && \
    cd /opt && wget  https://github.com/Kitware/CMake/releases/download/v3.10.2/cmake-3.10.2-Linux-x86_64.sh && \
    chmod +x ./cmake-3.10.2-Linux-x86_64.sh && \
    ./cmake-3.10.2-Linux-x86_64.sh --skip-license && \
    mkdir cmake-3.10.2-Linux-x86_64 && mv bin /opt/cmake-3.10.2-Linux-x86_64/bin/ && \
    mv share /opt/cmake-3.10.2-Linux-x86_64/share/ && \
    ln -s /opt/cmake-3.10.2-Linux-x86_64/bin/* /usr/local/bin 
    
    

ENV BOOST_ROOT=/opt/source/boost_1_67_0



