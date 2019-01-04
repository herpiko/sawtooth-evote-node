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
ARG NODE
RUN echo $NODE
RUN echo "sawtooth-validator -vv \
--endpoint tcp://172.20.1."$NODE":8800 \
--bind component:tcp://172.20.1."$NODE":4004 \
--bind network:tcp://172.20.1."$NODE":8800 \
--peers tcp://172.20.1.1:8800 \
--peers tcp://172.20.1.2:8800 \
--peers tcp://172.20.1.3:8800 \
--peers tcp://172.20.1.4:8800 \
--peers tcp://172.20.1.5:8800 \
--peers tcp://172.20.1.6:8800 \
--peers tcp://172.20.1.7:8800 \
--peers tcp://172.20.1.8:8800 \
--peers tcp://172.20.1.9:8800 \
--peers tcp://172.20.1.10:8800 \
--peers tcp://172.20.1.11:8800 \
--peers tcp://172.20.1.12:8800 \
--peers tcp://172.20.1.13:8800 \
--peers tcp://172.20.1.14:8800 \
--peers tcp://172.20.1.15:8800 \
--peers tcp://172.20.1.16:8800 \
--peers tcp://172.20.1.17:8800 \
--peers tcp://172.20.1.18:8800 \
--peers tcp://172.20.1.19:8800 \
--peers tcp://172.20.1.21:8800 \
--peers tcp://172.20.1.22:8800 \
--peers tcp://172.20.1.23:8800 \
--peers tcp://172.20.1.24:8800 \
--peers tcp://172.20.1.25:8800 \
--peers tcp://172.20.1.26:8800 \
--peers tcp://172.20.1.27:8800 \
--peers tcp://172.20.1.28:8800 \
--peers tcp://172.20.1.29:8800 \
--peers tcp://172.20.1.30:8800 \
--peers tcp://172.20.1.31:8800 \
--peers tcp://172.20.1.32:8800 \
--peers tcp://172.20.1.33:8800 \
--peers tcp://172.20.1.34:8800 \
--scheduler serial >> /tmp/sawtooth-logs/validator.log & \
settings-tp -v \
--connect tcp://172.20.1."$NODE":4004 >> /tmp/sawtooth-logs/settings-tp.log & \
sawtooth-rest-api -v \
--connect tcp://172.20.1."$NODE":4004 \
--bind 172.20.1."$NODE":8008 & \
cd tp && \
node index.js provinceVote tcp://172.20.1."$NODE":4004" >> /bin/ledger
RUN chmod +x /bin/ledger

CMD ["bash", "-c", "/bin/ledger"]
