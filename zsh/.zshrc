eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export ZSH="$HOME/.oh-my-zsh"
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	colored-man-pages
	fzf
)
source $ZSH/oh-my-zsh.sh

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
ZSH_COMPDUMP="${ZSH}/.zcompdump"
# Rebuild completion cache if older than 24h
if [[ -n ${ZSH_COMPDUMP}(#qN.mh+24) ]]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit -C -d "$ZSH_COMPDUMP"
fi

eval "$(fzf --zsh)"

export PATH="$HOME/.cargo/bin:$PATH"

alias g=git
alias n=nvim

alias d=docker
alias dc="docker compose"

alias tcd="~/home/scripts/tcd.sh"
# Use a function instead of an alias to avoid tmux errors when no server is running
cds() {
  cd "$(tmux display-message -p "#{session_path}")"
}

alias h="cd ~/home/"

alias bat="batcat"
export BAT_THEME="OneHalfLight"

eval "$(starship init zsh)"
