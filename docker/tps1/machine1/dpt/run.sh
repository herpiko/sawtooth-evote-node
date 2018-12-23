#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-transaction-processor tp
docker kill tps-1-dpt-1.skripsi.local;docker rm tps-1-dpt-1.skripsi.local; docker build -t tps-1-dpt-1.skripsi.local .
rm -rf tp
docker create -p 21311:21311 -p 21211:21211 --network tps1 --ip 172.30.0.111 --name tps-1-dpt-1.skripsi.local -ti tps-1-dpt-1.skripsi.local;
docker start tps-1-dpt-1.skripsi.local;
docker network connect national tps-1-dpt-1.skripsi.local

# Cockroach
docker kill tps-1-db-1.skripsi.local;docker rm tps-1-db-1.skripsi.local;
docker run -d --name=tps-1-db-1.skripsi.local --net=tps1 -p 23111:26257 cockroachdb/cockroach start --insecure

# Prepare db and table
sleep 5
docker exec -ti tps-1-db-1.skripsi.local /cockroach/cockroach sql --insecure -e "CREATE DATABASE dpt;"
docker exec -ti tps-1-db-1.skripsi.local /cockroach/cockroach sql --insecure -e "USE dpt;CREATE TABLE dpt (id serial, key varchar(100000), value varchar(100000));"

