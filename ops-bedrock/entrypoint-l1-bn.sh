#!/bin/bash
set -exu

exec /usr/local/bin/lighthouse \
  bn \
	--datadir="/db" \
	--http \
	--disable-peer-scoring \
	--disable-packet-filter \
  --execution-endpoint="${LH_EXECUTION_ENDPOINT}" \
	--execution-jwt=/config/jwt-secret.txt \
	"$@"
