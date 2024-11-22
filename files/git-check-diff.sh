#!/bin/bash

# a simple script to print local changes of your git repos (i.e check for pending work).

BASEDIR=${1:-"."}

for d in $(find $BASEDIR -type d -a -name .git); do
  dir=$(dirname $d)
  (cd $dir
  status=$(git status --porcelain | grep -v "^?? .idea" | grep -v "^?? .env" | grep -v "^?? .DS_Store")
  if [ -n "$status" ]; then
    echo "==> local changes in $dir"
    echo "$status"
  fi
  )
done
