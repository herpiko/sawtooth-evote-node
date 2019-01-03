#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -fR ../../../sawtooth-evote-transaction-processor tp
docker kill province-vote-14; docker rm province-vote-14.skripsi.local; docker build -t province-vote-14.skripsi.local .
rm -rf tp
docker create -p 12314:12314 -p 12214:12214 --network national --ip 172.20.1.14 --name province-vote-14.skripsi.local -ti province-vote-14.skripsi.local
docker start province-vote-14.skripsi.local
