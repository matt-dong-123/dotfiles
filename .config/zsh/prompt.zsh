# prompt substitution
setopt prompt_subst

# Colors
autoload -U colors && colors
local RESET='%f%k'
local RED='%F{red}'
local GREEN='%F{green}'
local BLUE='%F{blue}'
local MAGENTA='%F{magenta}'
local CYAN='%F{cyan}'
local GREY='%F{8}'

# Git
git_info() {
  local branch dirty stash
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  [[ -n $(git status --porcelain 2>/dev/null) ]] && dirty="*" || dirty=""
  [[ -n $(git stash list 2>/dev/null) ]] && stash="" || stash=""

  local upstream
  upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
  if [[ -n $upstream ]]; then
    ahead=$(git rev-list --count ${upstream}..HEAD 2>/dev/null)
    behind=$(git rev-list --count HEAD..${upstream} 2>/dev/null)

    [[ $ahead -gt 0 ]] && ahead="↑$ahead" || ahead=""
    [[ $behind -gt 0 ]] && behind="↓$behind" || behind=""
  fi

  echo "${GREY}$branch${dirty}${stash}${RESET} ${CYAN}${ahead}${behind}"
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
PROMPT='
${BLUE}%~${RESET} $(git_info)
$(prompt_char) '
TRANSIENT_PROMPT_PROMPT=$PROMPT
TRANSIENT_PROMPT_TRANSIENT_PROMPT="$(prompt_char) "
