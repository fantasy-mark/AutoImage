#!/bin/bash

git add .
first_line=$(head -n 1 Dockerfile)
pattern="# ([^ ]+)"
if [[ $first_line =~ $pattern ]]; then
	commit_info=${BASH_REMATCH[1]}
fi
git commit -m "Build $commit_info to https://github.com/fantasy-mark/AutoImage/actions"
git push -u origin main