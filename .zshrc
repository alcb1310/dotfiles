
export GOPATH="$HOME/go"

export EDITOR='nvim'

export PATH="$GOPATH:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

alias c="clear"
alias la="ls -al --color=auto"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ff="fastfetch"
alias vim="nvim"


# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

eval "$(zoxide init zsh --cmd cd)"

# pnpm
export PNPM_HOME="/home/andres/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Starship
eval "$(starship init zsh)"
