 #!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  >&2 echo "usage: $0 FILENAME[:LINENO][:IGNORED]"
  exit 1
fi

file=${1/#\~\//$HOME/}
type=$(file --brief --dereference --mime -- "$file")

if [ -d $file ]; then
    eza --tree --color=always $file --icons | head -200
elif [[ $type =~ image/ ]]; then
    chafa --size 50x --symbols block $file
elif [[ $type =~ =binary ]]; then
    file "$1"
else
    bat -n --color=always --line-range :500 $file
fi
