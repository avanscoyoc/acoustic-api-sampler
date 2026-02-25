FROM prefixdev/pixi:latest

WORKDIR /repo

COPY pixi.toml /repo/
RUN pixi install
COPY . /repo/

CMD ["pixi", "run", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]