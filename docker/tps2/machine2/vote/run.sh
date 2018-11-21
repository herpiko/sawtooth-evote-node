#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-transaction-processor tp
docker kill tps-2-vote-2.skripsi.local;docker rm tps-2-vote-2.skripsi.local; docker build -t tps-2-vote-2.skripsi.local .
rm -rf tp
docker create -p 22322:22322 -p 22222:22222 --network tps2 --ip 172.40.0.222 --name tps-2-vote-2.skripsi.local -ti tps-2-vote-2.skripsi.local;
docker start tps-2-vote-2.skripsi.local;
