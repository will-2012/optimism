FROM rust:1.69.0-bullseye AS builder
RUN apt-get update && apt-get -y upgrade && apt-get install -y cmake libclang-dev

RUN git clone https://github.com/sigp/lighthouse.git

ARG FEATURES
ARG PROFILE=release
ENV FEATURES $FEATURES
ENV PROFILE $PROFILE
RUN cd lighthouse && make

FROM ubuntu:22.04
RUN apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends \
  libssl-dev \
  ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/lighthouse /usr/local/bin/lighthouse

COPY l1-lighthouse-bn-entrypoint.sh /entrypoint-bn.sh
COPY l1-lighthouse-vc-entrypoint.sh /entrypoint-vc.sh

VOLUME ["/db"]
