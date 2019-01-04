#!/bin/bash
#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#
echo $1
cp -fR ../../../sawtooth-evote-transaction-processor tp
docker kill province-vote-benchmark-$1.skripsi.local; docker rm province-vote-benchmark-$1.skripsi.local; docker build --build-arg NODE=$1 -t province-vote-benchmark-node.skripsi.local .
rm -rf tp
docker create --network national --ip 172.20.1.$1 --name province-vote-benchmark-$1.skripsi.local -ti province-vote-benchmark-node.skripsi.local
docker start province-vote-benchmark-$1.skripsi.local
