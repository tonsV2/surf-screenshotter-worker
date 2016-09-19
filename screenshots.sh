#! /bin/sh


#wget https://www.dropbox.com/s/vqbuepllotx9hkl/Surf.txt

while read line; do
  set -- $line
  cmd="~/node_modules/.bin/pageres $1 $2 --selector=$3 --filename=$4"
  echo $cmd
  eval $cmd
  # Upload
  # curl --silent -F "secret_key=$SECRET_KEY" -F $4 -F payload=@$SCREENSHOT_FILE $POST_URL
  # Delete
  # rm $4
done < Surf.txt

#rm Surf.txt

