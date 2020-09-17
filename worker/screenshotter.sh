#! /bin/sh

DATA_URL=https://www.dropbox.com/s/l251zkduw52yrm2/screenshotconfig.txt?dl=0
#DATA_URL=http://screenshots.surfstation.dk/configuration/screenshotconfig.txt
PAGERES=/node_modules/.bin/pageres
DATA_FILE=data_file.txt

curl -L $DATA_URL -o $DATA_FILE

while read line; do
  set -- $line
  cmd="$PAGERES $1 $2 --selector=$3 --filename=$4 --hide='$5' --cookie '$6' --timeout=20"
  echo $cmd
  eval $cmd
  mv $4.png /data
done < $DATA_FILE

rm $DATA_FILE

