
FROM node:4
RUN useradd -ms /bin/bash me
WORKDIR /home/me
ADD launcher.sh .
ADD screenshotter.sh .
RUN npm install pageres-cli
USER me
ENTRYPOINT ["./launcher.sh", ">", "./screenshotter.log"]

