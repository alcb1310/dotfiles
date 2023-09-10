if [[ "$OSTYPE" == "linux-gnu"* ]]; then
     sudo pacman -S alacritty neovim tmux
elif [[ "$OSTYPE" == "darwin" ]]; then
     /bin/bash -c "$(curl fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     brew install --cask alacritty
     brew install neovim tmux
fi

ln -s ~/.dotfiles/alacritty/ ~/.config/alacritty
ln -s ~/.dotfiles/nvim/ ~/.config/nvim
ln -s ~/.dotfiles/tmux/ ~/.config/tmux
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

mv ~/.bashrc ~/.bashrc.old
ln -s ~/.dotfiles/.bashrc ~/.bashrc
