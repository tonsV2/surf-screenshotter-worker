
sudo docker network create surf

sudo docker stop screenshotter-worker && sudo docker rm screenshotter-worker && sudo docker build -t surf/screenshotter-worker . && sudo docker run --name screenshotter-worker --net=surf -d surf/screenshotter-worker && sudo docker exec -i -t screenshotter-worker bash

sudo docker stop screenshotter-http && sudo docker rm screenshotter-http && sudo docker build -t surf/screenshotter-http . && sudo docker run --name screenshotter-http --net=surf -d -p 80:80 surf/screenshotter-http


http://192.168.0.3/upload.php
http://192.168.0.3/uploads/

