#!/bin/bash

service=rene-nginx

if [[ -z "${1}" ]]; then
  docker buildx build --platform linux/arm64,linux/amd64 \
    -t gcr.io/ps-prod-container-repo/${service} --push .
else
  docker buildx build --platform linux/arm64,linux/amd64 \
    -t gcr.io/ps-prod-container-repo/${service}:"${1}" --push .
fi
