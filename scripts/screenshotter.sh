#! /bin/sh

DATA_FILE=/mnt/data/data_file.txt
PAGERES=/node_modules/.bin/pageres

mkdir -p /data/uploads

while read line; do
  set -- $line
  cmd="$PAGERES $1 $2 --selector=$3 --filename=$4 --hide='$5' --cookie '$6' --timeout=20"
  echo $cmd
  eval $cmd
  mv $4.png /data/uploads
done < $DATA_FILE

