FROM node:8
RUN useradd -ms /bin/bash me
WORKDIR /home/me
ADD launcher.sh .
ADD screenshotter.sh .
RUN npm install pageres-cli@4.0.0
USER me
ENTRYPOINT ["./launcher.sh", ">", "./screenshotter.log"]

