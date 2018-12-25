#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -fR ../../../sawtooth-evote-transaction-processor tp
docker kill province-vote-52; docker rm province-vote-52.skripsi.local; docker build -t province-vote-52.skripsi.local .
rm -rf tp
docker create -p 12352:12352 -p 12252:12252 --network national --ip 172.20.1.52 --name province-vote-52.skripsi.local -ti province-vote-52.skripsi.local
docker start province-vote-52.skripsi.local
