#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#
cp -fR ../../../sawtooth-evote-transaction-processor tp
docker kill province-vote-benchmark-1.skripsi.local; docker rm province-vote-benchmark-1.skripsi.local; docker build -t province-vote-benchmark-1.skripsi.local .
rm -rf tp
docker create --network national -p 8800:8800 -p 4004:4004 -p 8008:8008 --ip 172.20.1.1 --name province-vote-benchmark-1.skripsi.local -ti province-vote-benchmark-1.skripsi.local
docker start province-vote-benchmark-1.skripsi.local
