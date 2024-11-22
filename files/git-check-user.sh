#!/bin/bash

# a simple script to print which user name/email is used for your git repos (i.e verify gitconfig).

BASEDIR=${1:-"."}

for d in $(find $BASEDIR -type d -a -name .git); do
  dir=$(dirname $d)
  (cd $dir
  name=$(git config --get user.name)
  email=$(git config --get user.email)
  if [ -z "$name" -o -z "$email" ]; then
    echo "MISSING gitconfig: $dir is not configured $(git config --get remote.origin.url)"
  else
    echo "$name / $email : $dir"
  fi
  )
done
