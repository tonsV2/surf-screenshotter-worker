
FROM node:4
WORKDIR /app
ADD cmd/screenshots.sh .
ADD cmd/launch.sh .
RUN npm install pageres-cli
ENTRYPOINT ["launcher.sh"]

