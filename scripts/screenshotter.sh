#! /bin/bash

DATA_FILE=/mnt/data/data_file.txt
PAGERES=/node_modules/.bin/pageres

mkdir -p /data/uploads

rc=0

while read -r line; do
  set -- $line
  cmd="$PAGERES $1 $2 --selector=$3 --filename=$4 --hide='$5' --cookie '$6' --timeout=20"
  echo $cmd
  eval $cmd
  ((rc+=$?))
  mv "$4.png" /data/uploads
  ((rc+=$?))
done < $DATA_FILE

exit $rc
