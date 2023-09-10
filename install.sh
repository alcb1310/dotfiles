git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
     sudo pacman -S alacritty neovim tmux
     yay -S ttf-font-nerd
     bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
     mv ~/.bashrc ~/.bashrc.old
     ln -s ~/.dotfiles/.bashrc ~/.bashrc
     ln -s ~/.dotfiles/tmux/ ~/.config/tmux
elif [[ "$OSTYPE" == "darwin"* ]]; then
     /bin/bash -c "$(curl fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     brew tap homebrew/cask-fontsbrew tap homebrew/cask-fonts
     brew install --cask alacritty font-hack-nerd-font
     brew install neovim tmux
     ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
fi

ln -s ~/.dotfiles/alacritty/ ~/.config/alacritty
ln -s ~/.dotfiles/nvim/ ~/.config/nvim
~/.tmux/plugins/tpm/scripts/install_plugins.sh
