export FZF_DEFAULT_COMMAND="fd -H --strip-cwd-prefix -E .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t=d -H --strip-cwd-prefix -E .git"
export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME}/fzf/fzfrc"
export FZF_CTRL_R_OPTS="--preview ''"
export FZF_GIT_CAT="bat -n --color=always"

_fzf_git_fzf() {
    fzf --bind 'ctrl-/:change-preview-window(down,50%|hidden|)' "$@"
}

_fzf_compgen_path() {
    fd -H -E .git . "$1"
}

_fzf_compgen_dir() {
    fd -t=d -H -E .git . "$1"
}
