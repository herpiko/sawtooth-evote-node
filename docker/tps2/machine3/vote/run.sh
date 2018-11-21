#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-transaction-processor tp
docker kill tps-2-vote-3.skripsi.local;docker rm tps-2-vote-3.skripsi.local; docker build -t tps-2-vote-3.skripsi.local .
rm -rf tp
docker create -p 22323:22323 -p 22223:22223 --network tps2 --ip 172.40.0.223 --name tps-2-vote-3.skripsi.local -ti tps-2-vote-3.skripsi.local;
docker start tps-2-vote-3.skripsi.local;
