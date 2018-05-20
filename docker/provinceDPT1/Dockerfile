FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties curl iputils-ping git vim build-essential nodejs nodejs-legacy
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8AA7AF1F1091A5FD
RUN add-apt-repository 'deb http://repo.sawtooth.me/ubuntu/1.0/stable xenial universe'
RUN apt-get update
RUN apt-get install -y sawtooth
RUN sawtooth keygen --force
RUN sawset genesis
RUN sawadm genesis config-genesis.batch
RUN sawadm keygen
RUN echo "node -v" >> /bin/ledger
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
#RUN git clone https://github.com/herpiko/sawtooth-evote-transaction-processor tp
COPY tp/ tp 
RUN rm -rf tp/node_modules

RUN cd tp && npm install

RUN mkdir -p /tmp/sawtooth-logs

RUN echo "sawtooth-rest-api -v --connect tcp://127.0.0.1:4001 --bind 0.0.0.0:3001 & \
sawtooth-validator -vv --endpoint tcp://0.0.0.0:8800 --bind component:tcp://0.0.0.0:4001 --bind network:tcp://0.0.0.0:8800 --peers tcp://tps2:8800 --scheduler serial >> /tmp/sawtooth-logs/validator.log & \
settings-tp -v --connect tcp://127.0.0.1:4001 & \
cd tp && node index.js provinceDPT tcp://127.0.0.1:4001" >> /bin/ledger
RUN chmod +x /bin/ledger

CMD ["bash", "-c", "/bin/ledger"]
