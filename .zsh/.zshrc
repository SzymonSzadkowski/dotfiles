# Global variables
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
export TERM="xterm-256color"

# Aliases
alias vim="nvim"
alias tm="tmux"

# Custom scripts
source ~/.scripts/sessionScripts.sh
source ~/.scripts/projects.sh

# Plugins
source ~/.dotfiles/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/naqet/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end