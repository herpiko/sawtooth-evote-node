#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -vfR ../../../sawtooth-evote-transaction-processor tp
docker rm province-dpt-32; docker build -t province-dpt-32 .
rm -rf tp
docker run -p 11332:11332 -p 11232:11232 --network national --ip 172.20.0.32 --name province-dpt-32 -ti province-dpt-32
