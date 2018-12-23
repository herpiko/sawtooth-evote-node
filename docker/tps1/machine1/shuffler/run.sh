#
# Prepare the network first, docker network create --subnet=172.30.0.0/16 tps1
#

cp -fR ../../../../../sawtooth-evote-voter-machine/shuffler.js .
docker kill tps-1-dpt-shuffler.skripsi.local;docker rm tps-1-dpt-shuffler.skripsi.local; docker build -t tps-1-dpt-shuffler.skripsi.local .
docker create --network tps1 --name tps-1-dpt-shuffler.skripsi.local -ti tps-1-dpt-shuffler.skripsi.local;
docker start tps-1-dpt-shuffler.skripsi.local;
