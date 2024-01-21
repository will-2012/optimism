#!/bin/bash
set -exu

exec /usr/local/bin/lighthouse \
  vc \
	--datadir="/db" \
  --beacon-nodes="${LH_BEACON_NODES}" \
	"$@"
