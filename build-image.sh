#!/bin/bash
#DOCKERFILE_PATH=${1}
#CONTAINER_IMAGE=${2}
#IMAGE_TAG=${3}
docker build \
  --build-arg NewRelicVersion=${NEW_RELIC_VERSION} \
  --build-arg NewRelicUrl=${NEW_RELIC_URL} \
<<<<<<< HEAD
  --build-arg CONTAINER_IMAGE=${CONTAINER_IMAGE}${IMAGE_RUNTIME}:${IMAGE_TAG} \
=======
  --build-arg CONTAINER_IMAGE=${CONTAINER_IMAGE}:${IMAGE_TAG} \
>>>>>>> c7f96302a51a664564dff8f52e98b12bdb2fe42b
  --build-arg VERSION=$(git describe --tags --always) \
  --build-arg COMMIT=$(git rev-parse HEAD) \
  --build-arg URL=$(git config --get remote.origin.url) \
  --build-arg BRANCH=$(git rev-parse --abbrev-ref HEAD) \
  --build-arg DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
<<<<<<< HEAD
  -f $DOCKERFILE_PATH -t $IMAGE_NAME/${IMAGE_RUNTIME}:${IMAGE_TAG} .
if [[ "$TRAVIS_BRANCH" == "master" ]]  && [ "$TRAVIS_PULL_REQUEST" == "false" ] ; then
  docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
  docker push ${IMAGE_NAME}/${IMAGE_RUNTIME}:${IMAGE_TAG}
=======
  -f $DOCKERFILE_PATH -t $IMAGE_NAME:${IMAGE_TAG} .
if [[ "$TRAVIS_BRANCH" == "master" ]]  && [ "$TRAVIS_PULL_REQUEST" == "false" ] ; then
  docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
  docker push ${IMAGE_NAME}:${IMAGE_TAG}
>>>>>>> c7f96302a51a664564dff8f52e98b12bdb2fe42b
fi
