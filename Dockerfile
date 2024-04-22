FROM node:20
LABEL org.opencontainers.image.source https://github.com/filecoin-station/core
RUN apt-get update && apt-get install -y libsecret-1-dev dbus-x11 gnome-keyring xvfb
RUN Xvfb :99 -screen 0 1024x768x24 &
ENV DISPLAY=:99
USER node
WORKDIR /usr/src/app
COPY . .
RUN npm ci --omit=dev
ENV DEPLOYMENT_TYPE=docker
ENTRYPOINT [ "./scripts/docker-startup.sh" ]
