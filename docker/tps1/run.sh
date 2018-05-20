cp -vfR ../../transaction-processors tp
docker rm tps-1; docker build -t tps-1 . && docker run --network tps --name tps-1 -ti tps-1
