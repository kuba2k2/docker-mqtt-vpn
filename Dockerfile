# syntax=docker/dockerfile:1

FROM bitnami/minideb:bullseye

WORKDIR /app

COPY . .

RUN ./docker-build.sh

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
