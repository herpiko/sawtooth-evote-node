#!/bin/bash
kill -9 $(ps aux | grep sawtooth | grep -v grep | awk '{print $2}')
kill -9 $(ps aux | grep settings-tp | grep -v grep | awk '{print $2}')
rm -rf /var/lib/sawtooth/*
sawtooth keygen --force
swaadm keygen
sawtooth-rest-api -v --connect tcp://10.3.23.73:4004 --bind 10.3.23.73:8008 &
settings-tp -v --connect tcp://10.3.23.73:4004 &
sawtooth-validator -vv \
--endpoint tcp://10.3.23.73:8800 \
--bind component:tcp://10.3.23.73:4004 \
--bind network:tcp://10.3.23.73:8800 \
--peers tcp://10.2.206.83:8800 \
--scheduler serial
