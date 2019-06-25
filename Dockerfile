FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  build-essential \
  wget \
  git \
  vim

RUN mkdir -p /root/code
WORKDIR /root/code
RUN git clone https://github.com/vlang/v && \
  cd v/compiler && \
  wget https://vlang.io/v.c && \
  cc -w -o vc v.c && \
  ./vc -o v . && \
  rm vc

RUN ln -s $HOME/code/v/compiler/v /usr/local/bin/v
