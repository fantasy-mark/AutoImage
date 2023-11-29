#!/bin/bash

docker compose build
echo
echo "Show images on Server"
docker image ls