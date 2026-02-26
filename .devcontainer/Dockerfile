FROM ghcr.io/prefix-dev/pixi:latest

WORKDIR /workspace

COPY pixi.toml pixi.lock* ./
RUN pixi install

COPY . .

EXPOSE 8888