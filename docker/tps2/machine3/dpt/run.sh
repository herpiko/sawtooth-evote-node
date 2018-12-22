#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-transaction-processor tp
docker kill tps-2-dpt-3.skripsi.local;docker rm tps-2-dpt-3.skripsi.local; docker build -t tps-2-dpt-3.skripsi.local .
rm -rf tp
docker create -p 21323:21323 -p 21223:21223 --network tps2 --ip 172.40.0.123 --name tps-2-dpt-3.skripsi.local -ti tps-2-dpt-3.skripsi.local
docker start tps-2-dpt-3.skripsi.local;
docker network connect national tps-2-dpt-3.skripsi.local

# Cockroach
docker kill tps-2-db-3.skripsi.local;docker rm tps-2-db-3.skripsi.local;
docker run -d --name=tps-2-db-3.skripsi.local --net=tps2 -p 23122:26257 cockroachdb/cockroach start --insecure --join=tps-2-db-1.skripsi.local
