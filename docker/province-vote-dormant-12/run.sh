#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -fR ../../../sawtooth-evote-transaction-processor tp
docker kill province-vote-12; docker rm province-vote-12.skripsi.local; docker build -t province-vote-12.skripsi.local .
rm -rf tp
docker create -p 12312:12312 -p 12212:12212 --network national --ip 172.20.1.12 --name province-vote-12.skripsi.local -ti province-vote-12.skripsi.local
docker start province-vote-12.skripsi.local
