#!/bin/bash
set -e

fzf_args=(
    --preview 'brew info {}'
    --border-label 'Install HomeBrew Packages'
)

pkg_names=$((brew formulae; brew casks) | fzf "${fzf_args[@]}")

if [[ -n "pkg_names" ]]; then
    echo "$pkg_names" | tr '\n' ' ' | xargs brew install
    echo
    gum spin --spinner "dot" --title "Done! Press any key to close..." -- bash -c 'read -n 1 -s'
fi
