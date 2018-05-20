cp -vfR ../../transaction-processors tp
docker rm province-dpt-1; docker build -t province-dpt-1 .
rm -rf tp
docker run -p 3001:3001 -p 4001:4001 --network national --name province-dpt-1 -ti province-dpt-1
