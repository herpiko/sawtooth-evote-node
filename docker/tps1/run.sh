
docker kill $(docker ps -a | grep skripsi.local | grep tps-1 | cut -d' ' -f 1);
docker rm $(docker ps -a | grep skripsi.local | grep tps-1 | cut -d' ' -f 1);

# Deploy the ledgers
(cd machine1 && cd dpt && ./run.sh)
(cd machine2 && cd dpt && ./run.sh)
(cd machine3 && cd dpt && ./run.sh)
(cd machine1 && cd shuffler && ./run.sh)

(cd machine1 && cd vote && ./run.sh)
(cd machine2 && cd vote && ./run.sh)
(cd machine3 && cd vote && ./run.sh)
