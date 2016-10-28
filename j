#!/bin/bash
# source: https://github.com/lyoshenka/j
set -euo pipefail

DIR="$HOME/.journal"
EDITOR='vim "+normal Go" +star'


mkdir -p "$DIR"

FILENAME="$DIR/$(date +%Y%m%d).md"

[ -s "$FILENAME" ] && echo -ne "\n\n" >> $FILENAME
echo -ne "### $(date "+%b %d, %H:%M")\n\n" >> "$FILENAME"

eval $EDITOR "$FILENAME"

(
  cd "$DIR"
  git rev-parse --inside-work-tree >/dev/null 2>&1 || exit 0
  git add . && git commit -m "update"
  git rev-parse @{u} >/dev/null 2>&1 && git push
)
