#!/bin/bash

git add .
first_line=$(head -n 1 Dockerfile)
pattern="# ([^ ]+)"
if [[ $first_line =~ $pattern ]]; then
	image_name=${BASH_REMATCH[1]}
fi
echo "Build $image_name to https://github.com/fantasy-mark/AutoImage/actions"
git commit -m "Build $image_name to https://github.com/fantasy-mark/AutoImage/actions"
git push -u origin main