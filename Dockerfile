FROM ubuntu:xenial

MAINTAINER Wen-Wei Liao <wen-wei.liao@wustl.edu>

RUN apt-get update && \
    apt-get install build-essential && \
    apt-get install zlib1g-dev && \
    apt-get install libncurses5-dev && \
    apt-get install unzip

RUN wget https://root.cern.ch/download/root_v6.10.08.Linux-ubuntu16-x86_64-gcc5.4.tar.gz && \
    tar zxvf root_v6.10.08.Linux-ubuntu16-x86_64-gcc5.4.tar.gz && \
    export ROOTSYS=$HOME/root

RUN wget https://github.com/abyzovlab/CNVnator/releases/download/v0.3.3/CNVnator_v0.3.3.zip && \
    unzip CNVnator_v0.3.3.zip && \
    cd CNVnator_v0.3.3/src/samtools && \
    make && \
    cd .. && \
    export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${ROOTSYS}/lib && \
    make && \
    export PATH=$HOME/CNVnator_v0.3.3/src:$PATH
