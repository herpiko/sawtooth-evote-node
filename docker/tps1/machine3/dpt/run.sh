#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-transaction-processor tp
docker kill tps-1-dpt-3.skripsi.local;docker rm tps-1-dpt-3.skripsi.local; docker build -t tps-1-dpt-3.skripsi.local .
rm -rf tp
docker create -p 21313:21313 -p 21213:21213 --network tps1 --ip 172.30.0.113 --name tps-1-dpt-3.skripsi.local -ti tps-1-dpt-3.skripsi.local
docker start tps-1-dpt-3.skripsi.local;
docker network connect national tps-1-dpt-3.skripsi.local
