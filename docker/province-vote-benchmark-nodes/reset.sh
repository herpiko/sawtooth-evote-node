docker kill $(docker ps | grep benchmark | awk '{print $1}')
