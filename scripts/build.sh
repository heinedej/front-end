#!/usr/bin/env bash

set -ev

SCRIPT_DIR=$(dirname "$0")

if [[ -z "$GROUP" ]] ; then
  echo "Cannot find GROUP env var"
  exit 1
fi

if [[ -z "$COMMIT" ]] ; then
  echo "Cannot find COMMIT env var"
  exit 1
fi

if [[ "$(uname)" == "Darwin" ]]; then
  DOCKER_CMD=docker
else
  DOCKER_CMD="sudo docker"
fi

CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR

# REPO=${GROUP}/$(basename front-end);
# REPO=heinedej/$(basename front-end);

# $DOCKER_CMD build -t heinedej/front-end:${COMMIT} .
$DOCKER_CMD build -t heinedej/front-end .
