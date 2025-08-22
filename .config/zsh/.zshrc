# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "${ZINIT_HOME}" ]; then
    mkdir -p "$(dirname "${ZINIT_HOME}")"
    git clone https://github.com/zdharma-continuum/zinit "${ZINIT_HOME}"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light olets/zsh-transient-prompt
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light jeffreytse/zsh-vi-mode
zinit light hlissner/zsh-autopair
zinit light Aloxaf/fzf-tab
zinit snippet OMZP::sudo

# customize zsh-syntax-highlighting colors
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

# Envvars
export MANPAGER="nvim +Man!"

# Proxy
export https_proxy=http://127.0.0.1:7897;export http_proxy=http://127.0.0.1:7897;export all_proxy=socks5://127.0.0.1:7897

# Completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:*' fzf-flags \
    --height=40% \
    --preview="" \

# History
HISTSIZE=10000
HISTFILE=${ZDOTDIR}/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# FZF Configuration
source <(fzf --zsh)

# ─── FZF CONFIGURATION ─────────────────────────────────────────────────────────

export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME}/fzf/fzfrc"

show_file_or_dir_preview="
  if [ -d {} ]; then
    eza --tree --color=always {} | head -200
  else
    bat -n --color=always --line-range :500 {}
  fi
"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"

export FZF_CTRL_R_OPTS=""
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# ───────────────────────────────────────────────────────────────────────────────

eval "$(zoxide init --cmd cd zsh)"

# Aliases and functions
alias ls="eza --color=always --icons"
alias lg="lazygit"
alias f="fastfetch"
alias v="nvim"
alias e="nvim -c 'Oil --preview'"
alias c="cd ~/dotfiles"
alias n="cd ~/notes"
alias gc="cd ~/.config"
y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

[[ ! -f ${ZDOTDIR}/prompt.zsh ]] || source ${ZDOTDIR}/prompt.zsh
