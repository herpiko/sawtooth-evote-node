#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-transaction-processor tp
docker kill tps-2-dpt-1.skripsi.local;docker rm tps-2-dpt-1.skripsi.local; docker build -t tps-2-dpt-1.skripsi.local .
rm -rf tp
docker create -p 21321:21321 -p 21221:21221 --network tps2 --ip 172.40.0.121 --name tps-2-dpt-1.skripsi.local -ti tps-2-dpt-1.skripsi.local;
docker start tps-2-dpt-1.skripsi.local;
docker network connect national tps-2-dpt-1.skripsi.local
