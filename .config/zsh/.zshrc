eval "$(starship init zsh)"

# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "${ZINIT_HOME}" ]; then
    mkdir -p "$(dirname "${ZINIT_HOME}")"
    git clone https://github.com/zdharma-continuum/zinit "${ZINIT_HOME}"
fi

source "${ZINIT_HOME}/zinit.zsh"

autoload -U compinit && compinit

# Plugins
zinit ice depth=1
zinit light olets/zsh-transient-prompt
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting

export ZVM_READKEY_ENGINE=zle
export ZVM_KEYTIMEOUT=0.2
zinit light jeffreytse/zsh-vi-mode

zinit light hlissner/zsh-autopair
zinit light junegunn/fzf-git.sh
zinit snippet OMZP::sudo

ZVM_VI_SURROUND_BINDKEY="s-prefix"

# Completion
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:*' fzf-flags \
    --no-height \
    --preview=''

# History
HISTSIZE=10000
HISTFILE=${ZDOTDIR}/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# Options
## QOL
setopt autocd
setopt interactivecomments

## Globbing
setopt globdots extendedglob

## History
setopt histignoredups histignorealldups histsavenodups histfindnodups histignorespace
setopt sharehistory incappendhistory extendedhistory

# Starship
export STARSHIP_CONFIG=${ZDOTDIR}/starship.toml
TRANSIENT_PROMPT_PROMPT='$(starship prompt --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="$STARSHIP_CMD_STATUS" --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
TRANSIENT_PROMPT_RPROMPT='$(starship prompt --right --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="$STARSHIP_CMD_STATUS" --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
TRANSIENT_PROMPT_TRANSIENT_PROMPT='$(starship module character)'

# FZF Configuration
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd -H --strip-cwd-prefix -E .git"
export FZF_CTRL_T_COMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t=d -H --strip-cwd-prefix -E .git"
export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME}/fzf/fzfrc"
export FZF_CTRL_R_OPTS="--preview ''"

export FZF_GIT_CAT="bat -n --color=always"
_fzf_git_fzf() {
    fzf --height 50% --tmux 90%,70% \
        --layout reverse --multi --min-height 20+ --border \
        --no-separator --header-border horizontal \
        --border-label-pos 2 \
        --color 'label:blue' \
        --bind 'focus:transform-preview-label:""' \
        --bind 'ctrl-/:change-preview-window(down,50%|hidden|)' "$@"
}

_fzf_compgen_path() {
    fd -H -E .git . "$1"
}

_fzf_compgen_dir() {
    fd -t=d -H -E .git . "$1"
}

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Aliases and functions
alias ls="eza --color=always --icons -a"
alias lg="lazygit"
alias f="fastfetch"
alias v="nvim"
alias c="cd ~/dotfiles"
alias n="cd ~/notes"
alias cat="bat"
alias oc="opencode"
y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Git aliases
alias ga='git add'
alias gaa='git add -A'
alias gap='ga --patch'
alias gb='git branch'
alias gba='gb --all'
alias gc='git commit'
alias gca='gc --amend --no-edit'
alias gce='gc --amend'
alias gco='git checkout'
alias gcl='git clone --recursive'
alias gd='git diff'
alias gds='gd --staged'
alias gi='git init'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n"'
alias gm='git merge'
alias gn='git checkout -b' # new branch
alias gp='git push'
alias gr='git reset'
alias gs='git status --short'
alias gu='git pull' # mnemonic for `git update`
