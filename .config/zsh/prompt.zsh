# prompt substitution
setopt prompt_subst

# Colors
autoload -U colors && colors
local RESET='%f%k'
local RED='%F{red}'
local GREEN='%F{green}'
local BLUE='%F{blue}'
local MAGENTA='%F{magenta}'
local GREY='%F{8}'

# Git
git_info() {
  local branch dirty stash
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  [[ -n $(git status --porcelain 2>/dev/null) ]] && dirty="*" || dirty=""
  [[ -n $(git stash list 2>/dev/null) ]] && stash="" || stash=""
  echo "${GREY}$branch${dirty}${stash}${RESET}"
}

# colored prompt character
prompt_char() {
  local char="❯"
  if [[ -z $LAST_CMD_EXIT ]]; then
    echo "${MAGENTA}$char${RESET}"  # default
  elif (( $LAST_CMD_EXIT == 0 )); then
    echo "${MAGENTA}$char${RESET}"
  else
    echo "${RED}$char${RESET}"
  fi
}

# exit code
precmd() { LAST_CMD_EXIT=$? }

# prompt
PROMPT='${BLUE}%~${RESET} $(git_info)
$(prompt_char) '
TRANSIENT_PROMPT_PROMPT=$PROMPT
TRANSIENT_PROMPT_TRANSIENT_PROMPT="$(prompt_char) "
