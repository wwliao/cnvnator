FROM ubuntu:xenial

MAINTAINER Wen-Wei Liao <wen-wei.liao@wustl.edu>

RUN apt-get update && \
    apt-get install -y apt-utils build-essential zlib1g-dev libncurses5-dev \
    wget gzip unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /home/software && \
    wget --quiet https://root.cern.ch/download/root_v6.10.08.Linux-ubuntu16-x86_64-gcc5.4.tar.gz -O /home/software/root.tar.gz && \
    cd /home/software && tar xf /home/software/root.tar.gz && \
    rm /home/software/root.tar.gz

RUN wget --quiet https://github.com/abyzovlab/CNVnator/releases/download/v0.3.3/CNVnator_v0.3.3.zip -O /home/software/CNVnator_v0.3.3.zip && \
    cd /home/software && unzip /home/software/CNVnator_v0.3.3.zip && \
    rm /home/software/CNVnator_v0.3.3.zip && \
    cd /home/software/CNVnator_v0.3.3/src/samtools && make

ENV ROOTSYS /home/software/root

ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${ROOTSYS}/lib

RUN cd /home/software/CNVnator_v0.3.3/src && make

ENV PATH /home/software/CNVnator_v0.3.3/src:$PATH
