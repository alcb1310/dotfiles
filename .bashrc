alias ls='ls --color=auto'
alias la='ls -ahl --color=auto'
alias grep='grep --color=auto'
alias tree='tree -a --gitignore -I ".git" -C'

PS1='[\u@\h \W]\$ '

export GOPATH=$HOME/go
# export PATH=$PATH:$HOME/neovim/bin
export PATH=$PATH:$GOPATH/bin

export EDITOR=nvim

eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"

eval "$(starship init bash)"
