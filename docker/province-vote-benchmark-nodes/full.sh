#!/bin/bash
END=$TOTAL_INSTANCES
for i in $(seq 2 $END); do
  ./run.sh $i
done
