# Acoustic API Sampler

Acoustic sampling of project .wav files using the Soundhub platform's API. 

## Quick Start

### Using Docker

```bash
# Build image
docker build -t acoustic-api-sampler .

# Run container
docker run -it --rm -p 8888:8888 -v $(pwd):/repo acoustic-api-sampler
```

Access Jupyter Lab at `http://localhost:8888` (check terminal for token)

### Local Development

```bash
# Install dependencies (first time only)
pixi install

# Run Jupyter Lab
pixi run jupyter lab
```

Dependencies are managed in [pixi.toml](pixi.toml) and installed automatically in the container.
