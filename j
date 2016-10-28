#!/bin/bash

set -euo pipefail

EDITOR="vi"

DIR="$HOME/.journal"
mkdir -p "$DIR"

ARG=${1:-}

if [ "$ARG" = "last" ]; then
  FILENAME="$DIR/$(ls --reverse "$DIR" | head -n 1)"
else
  FILENAME="$DIR/$(date +%Y%m%d_%H%I%S).md"
fi

$EDITOR "$FILENAME"

#TIME=$(/usr/bin/time --format="%e" "$EDITOR" "$FILENAME" 2>&1 > /dev/null)
#MIN=$(echo "($TIME+0.5)/60" | bc)
#echo "\n\n#t:$MIN" >> "$FILENAME"
