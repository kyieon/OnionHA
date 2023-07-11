# Debian GNU/Linux 12 (bookworm)
FROM python:3.10

RUN apt-get update && \
    apt-get install -y \
      bash \
      curl \
      net-tools \
      netcat-openbsd \
      jq \
      docker.io \
      tzdata && \
      
  rm -rf /var/lib/apt/lists/*
    
WORKDIR /app
COPY . .

WORKDIR setup

RUN chmod +x build.sh
RUN ./build.sh

RUN chmod +x setup.sh
RUN echo "y" | ./setup.sh install

WORKDIR /

EXPOSE 7500/udp

CMD ["oniond", "start"]
