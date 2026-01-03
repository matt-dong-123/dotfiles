copy-command() {
    echo -n $BUFFER | pbcopy
    zle -M 'Copied to clipboard'
}
zle -N copy-command
bindkey '^Ey' copy-command

run-fzf() {
    zle -U '$(fzf)'
}
zle -N run-fzf
bindkey '^Ef' run-fzf

after-first() {
    zle beginning-of-line
    zle forward-word
}
zle -N after-first
bindkey '^E1' after-first

reload() {
    zle -I
    exec zsh <$TTY
}
zle -N reload
bindkey '^Er' reload
