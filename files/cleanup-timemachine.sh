#!/bin/zsh

set -e
set -o pipefail

# remove all backups older than X
if [ -z "$1" ]; then
  echo "Require YYYY-MM-DD parameter!"
  echo "Example: sudo $0 2022-12-01 execute"
  exit 1
fi
if [ "$(whoami)" != "root" ]; then
  echo "Needs to be run as root!"
  exit 1
fi

ts=$(date -j -f "%Y-%m-%d" "$1" +%s)
machinedir=$(tmutil machinedirectory)
backups=$(tmutil listbackups)
#echo "$backups"
for b in $(echo "$backups"); do
  b_ts=$(date -j -f "%Y-%m-%d-%H%M%S.backup" "$b" +%s)
  if [ $b_ts -lt $ts ]; then
    echo "Backup $b older than $1 - deleting..."
    if [ "$2" = "execute" ]; then
      tmutil delete -d "$machinedir" -t "${b//.backup/}"
    fi
  fi
done
