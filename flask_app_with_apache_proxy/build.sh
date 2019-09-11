#!/bin/bash -x

export IMAGE_REPO_NAME=repo_name
export IMAGE_TAG=1.0
repo="$IMAGE_REPO_NAME"
tag="$IMAGE_TAG"

function build()
{
  echo "[ECHO] Starting build STEP at $(date)"
  docker build -t mysql-local:${tag} --file Dockerfile.mysql --rm --no-cache .
  docker build -t flask-app:${tag} --file Dockerfile.flask --rm --no-cache .
  docker build -t apache-ws:${tag} --file Dockerfile.apache --rm --no-cache .

}

# MAIN

if [ "$0" = "$BASH_SOURCE" ] ; then

  build

fi