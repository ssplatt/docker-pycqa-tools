#!/usr/bin/env bash
while read -r file; do
  echo $file
  docker run --rm -i hadolint/hadolint < $file
done <<< "$(find . -name Dockerfile)"
