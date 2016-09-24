#! /bin/sh

DATA_URL=https://www.dropbox.com/s/vqbuepllotx9hkl/Surf.txt
SECRET_KEY=1a7adef0-9d3c-4fae-b1ea-10c3957fa1fb
POST_URL=http://screenshots.surfstation.dk/upload.php
PAGERES=~/node_modules/.bin/pageres
DATA_FILE=data_file.txt

curl -L $DATA_URL -o $DATA_FILE

while read line; do
  set -- $line
  cmd="$PAGERES $1 $2 --selector=$3 --filename=$4"
  eval $cmd
  echo "Posting screenshot: $4"
  curl -F "secret_key=$SECRET_KEY" -F "filename=$4.png" -F payload=@$4.png $POST_URL && rm $4.png
done < $DATA_FILE

rm $DATA_FILE
