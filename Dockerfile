Dockerfile: 
FROM ghcr.io/prefix-dev/pixi:latest

WORKDIR /repo

COPY pixi.lock /repo/pixi.lock
COPY pyproject.toml /repo/pyproject.toml

RUN /usr/local/bin/pixi install --manifest-path pyproject.toml

COPY entrypoint.sh /repo/entrypoint.sh
RUN chmod 700 /repo/entrypoint.sh

ENTRYPOINT [ "/repo/entrypoint.sh" ]

devcontainer.json:
{
  "name": "pixi_dir",
  "image": "ghcr.io/prefix-dev/pixi:latest",
  "workspaceFolder": "/repo",
  "mounts": [
    "source=${localWorkspaceFolder},target=/repo,type=bind,consistency=cached"
  ],
  "customizations": {
    "vscode": {
      "settings": {
        "python.pythonPath": "/repo/.pixi/envs/default/bin/python"
      }
    }
  },
  "postCreateCommand": "/usr/local/bin/pixi install",
  "remoteUser": "root"
}


entrypoint.sh: 
#!/bin/bash
exec /usr/local/bin/pixi shell

then run
chmod +x entrypoint.sh
docker build -f Dockerfile . -t pixi_dir
docker run -it --rm -p 8888:8888 -v $(pwd):/repo pixi_dir

