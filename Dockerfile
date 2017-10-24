FROM biocontainers/biocontainers:latest

LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="CNVnator"
LABEL software.version="0.3.3"
LABEL description="basic local alignment search tool"
LABEL website="https://github.com/abyzovlab/CNVnator"
LABEL documentation="https://github.com/abyzovlab/CNVnator/blob/master/README"
LABEL license="https://github.com/abyzovlab/CNVnator/blob/master/license.rtf"
LABEL tags="Genomics"

MAINTAINER Wen-Wei Liao <wen-wei.liao@wustl.edu>

RUN cd /home/biodocker && \
    GZIP=root_v6.10.08.Linux-ubuntu16-x86_64-gcc5.4.tar.gz && \
    wget --quiet -O - https://root.cern.ch/download/$GZIP | tar zxf -

RUN cd /home/biodocker && \
    ZIP=CNVnator_v0.3.3.zip && \
    wget --quiet -O - https://github.com/abyzovlab/CNVnator/releases/download/v0.3.3/$ZIP | unzip - && \
    cd /home/biodocker/CNVnator_v0.3.3/src/samtools && make

ENV ROOTSYS="/home/biodocker/root"
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$ROOTSYS/lib"

RUN cd /home/biodocker/CNVnator_v0.3.3/src && make

ENV PATH="$PATH:/home/biodocker/CNVnator_v0.3.3/src"

WORKDIR /data

CMD ["cnvnator"]
