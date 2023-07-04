FROM python:3.10

RUN \
  apt-get update && \
  apt-get install -y \
      bash \
      curl \
      net-tools \
      jq && \
  rm -rf /var/lib/apt/lists/*
      
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
