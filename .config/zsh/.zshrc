eval "$(starship init zsh)"

# Zgenom setup
ZGENOM_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zgenom/zgenom.git"

if [ ! -d "${ZGENOM_HOME}" ]; then
    mkdir -p "$(dirname "${ZGENOM_HOME}")"
    git clone https://github.com/jandamm/zgenom "${ZGENOM_HOME}"
fi

source "${ZGENOM_HOME}/zgenom.zsh"

zgenom autoupdate
if ! zgenom saved; then
    zgenom load jeffreytse/zsh-vi-mode

    zgenom save

    zgenom compile "$ZDOTDIR/.zshrc"
fi

export ZVM_READKEY_ENGINE=zle
export ZVM_KEYTIMEOUT=0.5
export ZVM_VI_SURROUND_BINDKEY="s-prefix"

function zvm_after_init() {
    zgenom load junegunn/fzf shell
    zgenom load junegunn/fzf-git.sh
    zgenom load Aloxaf/fzf-tab

    zgenom load zdharma-continuum/fast-syntax-highlighting
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load zsh-users/zsh-completions src

    zgenom load olets/zsh-transient-prompt
    zgenom load hlissner/zsh-autopair autopair.zsh

    zgenom ohmyzsh plugins/sudo
}

# Completion
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:*' fzf-flags \
    --no-height \
    --preview=''
autoload -U compinit && compinit

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

# FZF
export FZF_DEFAULT_COMMAND="fd -H --strip-cwd-prefix -E .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t=d -H --strip-cwd-prefix -E .git"
export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME}/fzf/fzfrc"
export FZF_CTRL_R_OPTS="--preview ''"
export FZF_GIT_CAT="bat -n --color=always"

_fzf_git_fzf() {
    fzf --height 50% --tmux 90%,70% \
        --layout reverse --multi --min-height 20+ --border \
        --no-separator \
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
lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
        rm -f $LAZYGIT_NEW_DIR_FILE >/dev/null
    fi
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
