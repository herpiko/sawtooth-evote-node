FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties curl iputils-ping git vim build-essential nodejs nodejs-legacy net-tools nmap
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8AA7AF1F1091A5FD
RUN add-apt-repository 'deb http://repo.sawtooth.me/ubuntu/1.0/stable xenial universe'
RUN apt-get update
RUN apt-get install -y sawtooth
RUN rm -rf /var/lib/sawtooth/*
RUN sawtooth keygen --force
RUN sawadm keygen
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
COPY tp/ tp 
RUN rm -rf tp/node_modules
RUN cd tp && npm install
RUN mkdir -p /tmp/sawtooth-logs

RUN echo "sawtooth-validator -vv \
--endpoint tcp://172.40.0.122:21122 \
--bind component:tcp://172.40.0.122:21222 \
--bind network:tcp://172.40.0.122:21122 \
--peers tcp://172.40.0.121:21121 \
--peers tcp://172.40.0.123:21123 \
--scheduler serial >> /tmp/sawtooth-logs/validator.log & \
settings-tp -v \
--connect tcp://172.40.0.122:21222 >> /tmp/sawtooth-logs/settings-tp.log & \
sawtooth-rest-api -v \
--connect tcp://172.40.0.122:21222 \
--bind 172.40.0.122:21322 & \
cd tp && \
node index.js localDPT tcp://172.40.0.122:21222" >> /bin/ledger
RUN chmod +x /bin/ledger

CMD ["bash", "-c", "/bin/ledger"]
