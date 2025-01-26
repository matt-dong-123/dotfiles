# Enable instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# envvars
export XDG_CONFIG_HOME="${HOME}/.config"
export EDITOR=nvim
export MANPAGER="nvim +Man!"
export WEZTERM_CONFIG_DIR="${HOME}/.config/wezterm"
export ZSH="$HOME/.oh-my-zsh"

# path
export PATH="$PATH:${HOME}/.local/bin"
export PATH="$HOME/.config/emacs/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# omz
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="true"
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    vi-mode
    fzf-tab
    sudo
)

source $ZSH/oh-my-zsh.sh

# FZF Configuration
eval "$(fzf --zsh)"
# export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

fg="#c0caf5"
bg="#1b1e2d"
bg_highlight="#292e42"
purple="#bb9af7"
blue="#2ac3de"
cyan="#73daca"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Tool Configurations
eval "$(zoxide init zsh)"
eval $(thefuck --alias)

# Aliases
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd="z"
alias lg="lazygit"
alias f="fastfetch"
alias v="nvim"
alias ldock="lazydocker"
alias ff='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'

# Functions
# Clear the screen cleanly in zellij
clear() {
    if [[ -n $ZELLIJ ]]; then
        zellij action clear
    else
        command clear
    fi
}
zle -N clear-screen clear
bindkey "^L" clear-screen

y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

vv() {
    select config in nvim lazyvim nvchad
    do
        NVIM_APPNAME=$config nvim $@
        break
    done
}

# Autostart Zellij
if [[ -z "$ZELLIJ" ]]; then
    zellij attach --create
fi
#
# Load P10k Configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
