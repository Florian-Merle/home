eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="$HOME/.cargo/bin:$PATH"

alias g=git
alias n=nvim
alias d=docker
alias dc="docker compose"
alias h="cd ~/home/"

eval "$(starship init bash)"
