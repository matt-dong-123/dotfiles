# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
zinit light romkatv/powerlevel10k
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light jeffreytse/zsh-vi-mode
zinit light hlissner/zsh-autopair
zinit snippet OMZP::sudo

# mini.surround-like surround behavior
ZVM_VI_SURROUND_BINDKEY='s-prefix'

# Envvars
export MANPAGER="nvim +Man!"

# Proxy
export https_proxy=http://127.0.0.1:7897;export http_proxy=http://127.0.0.1:7897;export all_proxy=socks5://127.0.0.1:7897

# Completion
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:*' fzf-flags \
    --no-height \
    --preview='' \

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

# FZF Configuration
zvm_after_init() {
    source <(fzf --zsh)
    source "${ZDOTDIR}/extensions/fzf-git.sh"
}
export KEYTIMEOUT=10    # For me to press fzf-git keybinds in time
export FZF_DEFAULT_COMMAND="fd -H --strip-cwd-prefix -E .git"
export FZF_CTRL_T_COMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t=d -H --strip-cwd-prefix -E .git"
export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME}/fzf/fzfrc"
export FZF_CTRL_R_OPTS="--preview ''"

_fzf_compgen_path() {
  fd -H -E .git . "$1"
}

_fzf_compgen_dir() {
  fd -t=d -H -E .git . "$1"
}


# Zoxide Initialization (replace cd)
eval "$(zoxide init --cmd cd zsh)"

# Aliases and functions
alias ls="eza --color=always --icons -a"
alias lg="lazygit"
alias f="fastfetch"
alias v="nvim"
alias e="nvim -c 'Oil --preview'"
alias c="cd ~/dotfiles"
alias n="cd ~/notes"
alias gc="cd ~/.config"
alias cat="bat"
y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
