#!/usr/bin/env bash
while read -r file; do
  echo $file
  DIRNAME=$(dirname $file)
  TAG=$(basename $DIRNAME)
  docker build -t ssplatt/pycqa-tools:$TAG $DIRNAME/.
done <<< "$(find . -name Dockerfile)"
