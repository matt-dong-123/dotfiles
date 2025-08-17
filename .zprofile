# Path
export PATH="$PATH:${HOME}/.local/bin:${HOME}/.cargo/bin:${HOME}/.config/emacs/bin"
eval "$(/opt/homebrew/bin/brew shellenv)"
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# pnpm
export PNPM_HOME="/Users/bulus-computer/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/matt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/matt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/matt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/matt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
