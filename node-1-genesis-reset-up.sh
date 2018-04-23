#!/bin/bash
kill -9 $(ps aux | grep sawtooth | grep -v grep | awk '{print $2}')
kill -9 $(ps aux | grep settings-tp | grep -v grep | awk '{print $2}')
rm -rf /var/lib/sawtooth/*
sawtooth keygen --force
sawset genesis
sawadm genesis config-genesis.batch
sawtooth-rest-api -v --connect tcp://192.168.88.9:4004 --bind 192.168.88.9:8008 &
settings-tp -v --connect tcp://192.168.88.9:4004 &
sawtooth-validator -vv \
--endpoint tcp://192.168.88.9:8800 \
--bind component:tcp://192.168.88.9:4004 \
--bind network:tcp://192.168.88.9:8800 \
--peers tcp://192.168.88.10:8800
--scheduler serial
