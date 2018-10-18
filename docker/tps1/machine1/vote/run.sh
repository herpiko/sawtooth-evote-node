#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-transaction-processor tp
docker kill tps-1-vote-1.skripsi.local;docker rm tps-1-vote-1.skripsi.local; docker build -t tps-1-vote-1.skripsi.local .
rm -rf tp
docker create -p 22311:22311 -p 22211:22211 --network tps1 --ip 172.30.0.211 --name tps-1-vote-1.skripsi.local -ti tps-1-vote-1.skripsi.local;
docker start tps-1-vote-1.skripsi.local;
