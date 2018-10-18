#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-transaction-processor tp
docker kill tps-1-vote-3.skripsi.local;docker rm tps-1-vote-3.skripsi.local; docker build -t tps-1-vote-3.skripsi.local .
rm -rf tp
docker create -p 22313:22313 -p 22213:22213 --network tps1 --ip 172.30.0.213 --name tps-1-vote-3.skripsi.local -ti tps-1-vote-3.skripsi.local;
docker start tps-1-vote-3.skripsi.local;
