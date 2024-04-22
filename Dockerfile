FROM node:20
LABEL org.opencontainers.image.source https://github.com/filecoin-station/core
RUN apt-get update && apt-get install -y libsecret-1-dev
USER node
WORKDIR /usr/src/app
COPY . .
RUN npm ci --omit=dev
ENV DEPLOYMENT_TYPE=docker
CMD [ "./bin/station.js" ]
