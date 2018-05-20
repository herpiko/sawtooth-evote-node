cp -vfR ../../transaction-processors tp
docker rm province-dpt-1; docker build -t province-dpt-1 . && docker run --network national --name province-dpt-1 -ti province-dpt-1
