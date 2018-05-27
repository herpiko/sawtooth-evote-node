#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -vfR ../../transaction-processors tp
docker rm province-dpt-34; docker build -t province-dpt-34 .
rm -rf tp
docker run -p 11334:11334 -p 11234:11234 --network national --ip 172.20.0.34 --name province-dpt-34 -ti province-dpt-34
