#
# Prepare the network first, docker network create --subnet=172.20.0.0/16 national
#

cp -vfR ../../transaction-processors tp
docker rm province-dpt-52; docker build -t province-dpt-52 .
rm -rf tp
docker run -p 11352:11352 -p 11252:11252 --network national --ip 172.20.0.52 --name province-dpt-52 -ti province-dpt-52
