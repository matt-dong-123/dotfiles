#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    >&2 echo "usage: $0 FILENAME[:LINENO][:IGNORED]"
    exit 1
fi

file=${1/#\~\//$HOME/}
type=$(file --brief --dereference --mime -- "$file")

if [ -d "$file" ]; then
    eza --tree --color=always --icons --all "$file"
elif [[ $type =~ image/ ]]; then
    chafa --size 50x "$file"
elif [[ $type =~ =binary ]]; then
    file "$1"
else
    bat -n --color=always --line-range :500 "$file"
fi
