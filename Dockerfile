FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  make \
  curl \
  vim

WORKDIR /root
RUN git clone https://github.com/vlang/v && \
  cd v/compiler && \
  make
RUN ln -s /root/v/compiler/v /usr/local/bin/v

