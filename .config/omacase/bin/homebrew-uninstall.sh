#!/bin/bash
set -e

fzf_args=(
    --preview 'brew info {}'
    --border-label ' 📦 brew uninstall '

    --style full
    --prompt '❯ '
    --no-height
    --multi
    --layout reverse
    --border --padding 1,2
    --border-label-pos 2
    --input-label ' Input '
    --bind 'result:transform-list-label:
        if [[ -z $FZF_QUERY ]]; then
          echo " $FZF_MATCH_COUNT items "
        else
          echo " $FZF_MATCH_COUNT matches for [$FZF_QUERY] "
        fi
        '
    --bind 'focus:transform-preview-label:[[ -n {} ]] && printf " Previewing [%s] " {}'
    --color 'border:#aaaaaa,label:#cccccc'
    --color 'preview-border:#aa77cc,preview-label:#cc99ff'
    --color 'list-border:#77aa77,list-label:#99cc99'
    --color 'input-border:#dd6666,input-label:#ff8888'
    --color 'header-border:#77aadd,header-label:#99ccff'
    --color 'fg:#cccccc,bg:#1b1e2d,hl:#cc99ff'
    --color 'fg+:#cccccc,bg+:#1b1e2d,hl+:#cc99ff'
    --color 'info:#ff77bb,prompt:#ff8888,pointer:#99cc99'
    --color 'marker:#99cc99,spinner:#99cc99,header:#99cc99'
)

pkg_names=$(brew list -1| fzf "${fzf_args[@]}")

if [[ -n "pkg_names" ]]; then
    echo "$pkg_names" | tr '\n' ' ' | xargs brew-file brew uninstall
    echo
    gum spin --spinner "dot" --title "Done! Press any key to close..." -- bash -c 'read -n 1 -s'
fi
