#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -fR ../../../sawtooth-evote-transaction-processor tp
docker rm province-dpt-32.skripsi.local; docker build -t province-dpt-32.skripsi.local .
rm -rf tp
docker create -p 11332:11332 -p 11232:11232 --network national --ip 172.20.0.32 --name province-dpt-32.skripsi.local -ti province-dpt-32.skripsi.local
docker start province-dpt-32.skripsi.local
