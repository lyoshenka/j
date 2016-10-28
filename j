#!/bin/bash

set -euo pipefail

DIR="$HOME/.journal"
mkdir -p "$DIR"

FILENAME="$DIR/$(date +%Y%m%d).md"

NEWLINES=""
if [ -s "$FILENAME" ]; then
  NEWLINES="\n\n"
fi

touch "$FILENAME"

echo -e "$NEWLINES### $(date "+%b %d, %H:%M")\n" >> "$FILENAME"

vim '+normal Go' +star "$FILENAME"

(
  cd "$DIR"
  git rev-parse --inside-work-tree >/dev/null 2>&1 || exit 0
  git add . && git commit -m "update"
)
