
FROM node:4
RUN useradd -ms /bin/bash me
WORKDIR /home/me
ADD cmd/screenshotter.sh .
ADD cmd/launcher.sh .
RUN npm install pageres-cli
USER me
ENTRYPOINT ["./launcher.sh", ">", "./screenshotter.log"]

