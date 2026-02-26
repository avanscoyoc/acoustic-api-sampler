FROM ghcr.io/prefix-dev/pixi:latest

WORKDIR /workspace

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
COPY pixi.toml pixi.lock* ./
RUN pixi install

COPY . .

EXPOSE 8888
