#! /bin/sh

#DATA_URL=https://www.dropbox.com/s/gb9qn9o1nik767r/screenshotkonfig.txt
DATA_URL=http://screenshots.surfstation.dk/configuration/screenshotconfig.txt
SECRET_KEY=1a7adef0-9d3c-4fae-b1ea-10c3957fa1fb
POST_URL=http://screenshots.surfstation.dk/upload.php
# www need to match what's in docker-compose.yml
#POST_URL=http://www/upload.php
PAGERES=../node_modules/.bin/pageres
DATA_FILE=data_file.txt

curl -L $DATA_URL -o $DATA_FILE

while read line; do
  set -- $line
  cmd="$PAGERES $1 $2 --selector=$3 --filename=$4 --hide='$5' --cookie '$6' --timeout=20"
  echo $cmd
  echo "Posting screenshot: $4"
  curl -F "secret_key=$SECRET_KEY" -F "filename=$4.png" -F payload=@$4.png $POST_URL
  rm $4.png
done < $DATA_FILE

rm $DATA_FILE

