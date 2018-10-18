#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -fR ../../../sawtooth-evote-transaction-processor tp
docker kill province-dpt-52; docker rm province-dpt-52.skripsi.local; docker build -t province-dpt-52.skripsi.local .
rm -rf tp
docker create -p 11352:11352 -p 11252:11252 --network national --ip 172.20.0.52 --name province-dpt-52.skripsi.local -ti province-dpt-52.skripsi.local
docker start province-dpt-52.skripsi.local
