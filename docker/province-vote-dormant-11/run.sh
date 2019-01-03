#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -fR ../../../sawtooth-evote-transaction-processor tp
docker kill province-vote-11; docker rm province-vote-11.skripsi.local; docker build -t province-vote-11.skripsi.local .
rm -rf tp
docker create -p 12311:12311 -p 12211:12211 --network national --ip 172.20.1.11 --name province-vote-11.skripsi.local -ti province-vote-11.skripsi.local
docker start province-vote-11.skripsi.local
