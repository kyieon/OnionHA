FROM python:3.10-alpine

RUN \
  apk update && \
  apk add curl --no-cache && \
  apk add bash --no-cache && \
  apk add jq --no-cache && \
  apk add net-tools --no-cache && \
  rm -rf /var/cache/apk/*

WORKDIR /app
COPY . .

RUN pwd
RUN ls

WORKDIR setup

RUN pwd
RUN ls

RUN chmod +x build.sh
RUN ./build.sh

RUN chmod +x setup.sh
RUN ./setup.sh install

EXPOSE 7500

CMD ["oniond", "start"]
