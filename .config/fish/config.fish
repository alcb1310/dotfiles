if status is-interactive
    # Commands to run in interactive sessions can go here
end

function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

alias la 'ls -al'
alias c 'clear'
#alias vim 'nvim'
alias nvichad="NVIM_APPNAME=nvchad nvim"


set PATH $PATH /opt/homebrew/opt/postgresql@16/bin
set PATH $PATH /Users/andres/go/bin/
set PATH $PATH /Users/andres/scripts/
set PATH $PATH /Users/andres/.config/tmux/plugins/tmuxifier/bin
set PATH $PATH /opt/homebrew/bin
set PATH $PATH /opt/homebrew/sbin
set PATH $PATH /usr/local/bin
set PATH $PATH /System/Cryptexes/App/usr/bin
set PATH $PATH /usr/bin
set PATH $PATH /bin
set PATH $PATH /usr/sbin
set PATH $PATH /sbin
set PATH $PATH /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin
set PATH $PATH /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin
set PATH $PATH /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
set PATH $PATH /Users/andres/Library/pnpm
set PATH $PATH /opt/homebrew/opt/postgresql@16/bin
set PATH $PATH /Users/andres/go/bin/
set PATH $PATH /Users/andres/scripts/
set PATH $PATH /Users/andres/.config/tmux/plugins/tmuxifier/bin
set PATH $PATH /opt/homebrew/bin
set PATH $PATH /opt/homebrew/sbin
set PATH $PATH /opt/homebrew/opt/fzf/bin

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

zoxide init --cmd cd fish | source
