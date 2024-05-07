# Global variables
export EDITOR="nvim"

# Aliases
alias vim="nvim"
alias tm="tmux"
alias sn="~/.scripts/sessionizer.sh"
alias dot="cd ~/.dotfiles && nvim"
alias fixdocker="sudo ln -s ~/.docker/run/docker.sock /var/run/docker.sock "

# Additinal settings
bindkey -e
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Custom scripts
source ~/.scripts/worktree-branch.sh

# Plugins
source ~/.dotfiles/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/naqet/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Golang
export PATH="$PATH:$HOME/go/bin"

