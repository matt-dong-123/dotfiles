# Path
export PATH="${HOME}/.local/bin:${HOME}/.cargo/bin:${HOME}/.config/omacase/bin:${HOME}/.config/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
