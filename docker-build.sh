#!/bin/bash
source sha_function.sh

if [ $# -le 1 ]; then
  echo "missing parameters."
  exit 1
fi

sha=$(get_manifest_sha $@)   #  amd64|arm|arm64
echo $sha
base_image="treehouses/debian@$sha"
echo $base_image
arch=$2   # arm arm64 amd64

if [ -n "$sha" ]; then
  tag=treehouses/apache-tags:$arch
  sed "s|{{base_image}}|$base_image|g" Dockerfile.template > Dockerfile.$arch
  docker build -t $tag -f Dockerfile.$arch .
fi
