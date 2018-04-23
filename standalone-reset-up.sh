if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi
kill -9 $(ps aux | grep sawtooth | grep -v grep | awk '{print $2}')
kill -9 $(ps aux | grep settings-tp | grep -v grep | awk '{print $2}')
rm -rf /var/lib/sawtooth/*
sawtooth keygen --force
sawset genesis
sawadm genesis config-genesis.batch
sawtooth-rest-api -v &
settings-tp -v &
sawtooth-validator -v
