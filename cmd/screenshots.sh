#! /bin/sh

SECRET_KEY=a40f4738-758f-11e4-9649-7845c4be5139
POST_URL=http://screenshots.surfstation.dk/upload.php

wget https://www.dropbox.com/s/vqbuepllotx9hkl/Surf.txt

while read line; do
  set -- $line
  cmd="~/node_modules/.bin/pageres $1 $2 --selector=$3 --filename=$4"
  eval $cmd
  curl --silent -F "secret_key=$SECRET_KEY" -F "filename=$4.png" -F payload=@$4.png $POST_URL && rm $4.png
done < Surf.txt

rm Surf.txt

