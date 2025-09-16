#!/bin/bash

VERSION=$1
VS_PATH="vintage-story"


if [ VERSION ]; then
  if [ "$(ls -A ${VS_PATH})" ]; then
    find ${VS_PATH} -mindepth 1 \( -path './Mods' -o -path './Maps' \) -prune -o -exec rm -rf {} +
  fi

  if [ ! -d ${VS_PATH} ]; then
    mkdir -p ${VS_PATH}
  fi

  echo ${VERSION} > ${VS_PATH}/.version
  curl -O https://cdn.vintagestory.at/gamefiles/stable/vs_server_linux-x64_${VERSION}.tar.gz
  tar xzf vs_server_linux-x64_${VERSION}.tar.gz -C $VS_PATH && rm vs_server_linux-x64_${VERSION}.tar.gz
fi