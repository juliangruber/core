FROM node:20
LABEL org.opencontainers.image.source https://github.com/filecoin-station/core
USER node
WORKDIR /usr/src/app
COPY . .
RUN sudo apt install libsecret-1-dev
RUN npm ci --omit=dev
ENV DEPLOYMENT_TYPE=docker
CMD [ "./bin/station.js" ]
