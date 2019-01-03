#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -fR ../../../sawtooth-evote-transaction-processor tp
docker kill province-vote-13; docker rm province-vote-13.skripsi.local; docker build -t province-vote-13.skripsi.local .
rm -rf tp
docker create -p 12313:12313 -p 12213:12213 --network national --ip 172.20.1.13 --name province-vote-13.skripsi.local -ti province-vote-13.skripsi.local
docker start province-vote-13.skripsi.local
