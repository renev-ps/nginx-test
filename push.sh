#!/bin/bash

SERVICE="rene-nginx"
COMMITID=$(git log -1 --pretty=%h)
REPO="gcr.io/ps-prod-container-repo/"
TAG="$REPO$SERVICE:${1}-$COMMITID"
echo ${TAG}
echo "************************************"
echo "***** Commit ID ${COMMITID} ********"
echo "************************************"

docker buildx build --platform linux/arm64,linux/amd64 --build-arg VERSION="${COMMITID}" \
-t ${TAG} --push .

echo "To run container run:"
echo "docker run -d -p 9090:80 --name rene-nginx gcr.io/ps-prod-container-repo/rene-nginx:latest-${COMMITID}"
echo
echo "navigate to localhost:9090"
echo
echo "To print see the commit ID showing changes are taking place, run:"
echo "docker exec rene-nginx env"
echo
echo "After running to remove container run:"
echo "docker rm -f rene-nginx"