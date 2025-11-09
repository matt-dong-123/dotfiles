ZGENOM_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zgenom/zgenom.git"

if [ ! -d "${ZGENOM_HOME}" ]; then
    mkdir -p "$(dirname "${ZGENOM_HOME}")"
    git clone https://github.com/jandamm/zgenom "${ZGENOM_HOME}"
fi

source "${ZGENOM_HOME}/zgenom.zsh"

zgenom autoupdate
if ! zgenom saved; then
    zgenom load zdharma-continuum/fast-syntax-highlighting
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load zsh-users/zsh-completions src

    zgenom load olets/zsh-transient-prompt

    zgenom ohmyzsh plugins/sudo

    zgenom load jeffreytse/zsh-vi-mode

    zgenom save

    zgenom compile "$ZDOTDIR"
fi

function zvm_after_init() {
    source <(fzf --zsh)
    zgenom load junegunn/fzf-git.sh
    zgenom load Aloxaf/fzf-tab

    zgenom load hlissner/zsh-autopair autopair.zsh
}
