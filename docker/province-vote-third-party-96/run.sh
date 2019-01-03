#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -fR ../../../sawtooth-evote-transaction-processor tp
docker kill province-vote-96; docker rm province-vote-96.skripsi.local; docker build -t province-vote-96.skripsi.local .
rm -rf tp
docker create -p 12396:12396 -p 12296:12296 --network national --ip 172.20.1.96 --name province-vote-96.skripsi.local -ti province-vote-96.skripsi.local
docker start province-vote-96.skripsi.local
