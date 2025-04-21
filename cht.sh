#!/usr/bin/env bash

# primeagen's horrible bash script, i'm gonna have to make it better... someday

# Define languages and coreutils here
languages=$(echo "golang lua cpp python java bash zsh" | tr ' ' '\n')
core_utils=$(echo "xargs find mv sed awk tmux fzf grep" | tr ' ' '\n')

# pipe into fzf
selected=$(printf "%s\n%s" "$languages" "$core_utils" | fzf)

# query
read -p "What are you looking for in $selected? " query

# check language or coreutils and open page in separate tmux window
if echo "$languages" | grep -qs "$selected"; then
    tmux neww bash -c "curl 'cht.sh/$selected/$(echo "$query" | tr ' ' '+')' & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl 'cht.sh/$selected~$query' & while [ : ]; do sleep 1; done"
fi
