FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  build-essential \
  wget \
  git \
  vim

WORKDIR /root
RUN git clone https://github.com/vlang/v && \
  cd v/compiler && \
  wget https://vlang.io/v.c && \
  cc -w -o vc v.c && \
  ./vc -o v . && \
  rm vc && \
  ./v -o v .

RUN ln -s /root/v/compiler/v /usr/local/bin/v
