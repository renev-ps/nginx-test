#!/bin/bash

SERVICE="rene-nginx"
VERSION=$(git log -1 --pretty=%h)
REPO="gcr.io/ps-prod-container-repo/"
TAG="$REPO$SERVICE:${1}-$VERSION"
echo ${TAG}


echo "*****${VERSION}********"

docker buildx build --platform linux/arm64,linux/amd64 --build-arg VERSION="${VERSION}" \
-t ${TAG} --push .