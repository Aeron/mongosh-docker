# MongoDB Shell Docker Image

A compact [`mongosh`](https://docs.mongodb.com/mongodb-shell/) Docker image based on
[`bitnami/minideb`](https://hub.docker.com/r/bitnami/minideb) base image.

**For interactive usage only**. No bells and whistles included.

## Usage

This image is available as [`aeron/mongosh`](https://hub.docker.com/r/aeron/mongosh)
from Docker Hub and
[`ghcr.io/Aeron/mongosh`](https://github.com/Aeron/mongosh-docker/pkgs/container/mongosh)
from GitHub Container Registry. You can use them both interchangeably.

```sh
docker pull aeron/mongosh
# …or…
docker pull ghcr.io/aeron/mongosh
```

### Interactive Mode (Docker)

Run a container and pass a Mongo URI string, like the following:

```sh
docker run -it --rm aeron/mongosh:latest -- $MONGO_URI
# …or…
docker run -it --rm aeron/mongosh:latest -- mongodb://127.0.0.1:27017
```

Any [CLI options](https://docs.mongodb.com/mongodb-shell/reference/options/) `mongosh`
supports could be provided alike:

```sh
docker run -it --rm aeron/mongosh:latest -- $MONGO_URI \
    --nodb \
    --eval 'disableTelemetry()'
```

### Interactive Mode (Kubernetes)

Run a container inside a Kube cluster in a similar manner:

```sh
kubectl run mongosh --rm --tty -i --restart=Never \
    --image aeron/mongosh:latest -- $MONGO_URI
```

CLI options and everything else is the same here.

### Daemon Mode

Nope, not going to happen. It’s not the purpose of this image.

If you actually need it, feel free to use this image as a basis. Then you need to
install the `coreutils` package and change Dockerfile’s entrypoint directive to
`["sleep" "infinity"]`.

Or use a different image that allows that. It’d be more painless, probably.
