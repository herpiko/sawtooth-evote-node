#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-transaction-processor tp
docker kill tps-1-dpt-1.skripsi.local;docker rm tps-1-dpt-1.skripsi.local; docker build -t tps-1-dpt-1.skripsi.local .
rm -rf tp
docker create -p 21311:21311 -p 21211:21211 --network tps1 --ip 172.30.0.111 --name tps-1-dpt-1.skripsi.local -ti tps-1-dpt-1.skripsi.local;
docker start tps-1-dpt-1.skripsi.local;
docker network connect national tps-1-dpt-1.skripsi.local
