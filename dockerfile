FROM docker.io/bitnami/minideb:bookworm

LABEL org.opencontainers.image.source https://github.com/Aeron/mongosh-docker
LABEL org.opencontainers.image.licenses MIT

RUN install_packages \
    ca-certificates \
    curl \
    gnupg \
    openssl

ARG PGP_URL=https://www.mongodb.org/static/pgp
ARG REPO_URL=https://repo.mongodb.org/apt/debian

ARG MONGODB_VERSION=6.0
ARG MONGOSH_VERSION=2.5.2

RUN curl -fsSL ${PGP_URL}/server-${MONGODB_VERSION}.asc \
    | gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-org-${MONGODB_VERSION}.gpg \
    && echo "deb ${REPO_URL} bookworm/mongodb-org/${MONGODB_VERSION} main" \
    | tee /etc/apt/sources.list.d/mongodb-org-${MONGODB_VERSION}.list

RUN install_packages \
    mongodb-mongosh=${MONGOSH_VERSION}
RUN apt remove -y --purge \
    curl \
    gnupg

ENTRYPOINT ["mongosh"]
