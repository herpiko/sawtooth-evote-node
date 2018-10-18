#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-transaction-processor tp
docker rm tps-1-dpt-1; docker build -t tps-1-dpt-1 .
rm -rf tp
docker run -p 21311:21311 -p 21211:21211 --network tps1 --ip 172.30.0.111 --name tps-1-dpt-1 -ti tps-1-dpt-1
