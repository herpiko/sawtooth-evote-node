#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -fR ../../../sawtooth-evote-transaction-processor tp
docker kill province-vote-32; docker rm province-vote-32.skripsi.local; docker build -t province-vote-32.skripsi.local .
rm -rf tp
docker create -p 12332:12332 -p 12232:12232 --network national --ip 172.20.1.32 --name province-vote-32.skripsi.local -ti province-vote-32.skripsi.local
docker start province-vote-32.skripsi.local
