FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl git \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://pixi.sh/install.sh | bash
ENV PATH="/root/.pixi/bin:${PATH}"

WORKDIR /workspace

COPY pixi.toml pixi.lock* ./
RUN pixi install --frozen

COPY . .

CMD ["pixi", "run", "jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
