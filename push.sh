#!/bin/bash

SERVICE="rene-nginx"
COMMITID=$(git log -1 --pretty=%h)
REPO="gcr.io/ps-prod-container-repo/"
TAG="$REPO$SERVICE:${1}-$COMMITID"
echo ${TAG}

echo "${COMMITID}" > index.html

echo "*****${COMMITID}********"

docker buildx build --platform linux/arm64,linux/amd64 --build-arg VERSION="${COMMITID}" \
-t ${TAG} --push .