#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -fR ../../../sawtooth-evote-transaction-processor tp
docker rm province-dpt-91; docker build -t province-dpt-91 .
rm -rf tp
docker run -p 11391:11391 -p 11291:11291 --network national --ip 172.20.0.91 --name province-dpt-91 -ti province-dpt-91
