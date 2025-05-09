# My Dotfiles Configuration

## Programs

![Alacritty](https://img.shields.io/badge/alacritty-F46D01?style=for-the-badge&logo=alacritty&logoColor=white)
![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Tmux](https://img.shields.io/badge/tmux-1BB91F?style=for-the-badge&logo=tmux&logoColor=white)
![ZSH](https://img.shields.io/badge/zsh-2ECC71?style=for-the-badge&logo=ZSH&logoColor=white)

## Requirements

Ensure you have the followin installed on your system

### Alacritty

On a Mac computer you should run:

```bash
brew install --cask alacritty
```

On a Archlinux installation you should run:

```bash
sudo pacman -S alacritty
```

### Neovim

On a Mac computer you should run:

```bash
brew install neovim
```

On a Archlinux installation you should run:

```bash
sudo pacman -S neovim
```

### Tmux

On a Mac computer you should run:

```bash
brew install tmux
```

On a Archlinux installation you should run:

```bash
sudo pacman -S tmux
```

### Git

On a Mac computer you should run:

```bash
brew install git
```

On a Archlinux installation you should run:

```bash
sudo pacman -S git
```

### Stow

```bash
brew install stow
```

On a Archlinux installation you should run:

```bash
sudo pacman -S stow
```

### Installation

First checkout the dotfiles repo in your $HOME directory using git

```bash
git clone https://github.com/alcb1310/dotfiles.git
cd dotfiles
```

then use GNU stow to create the symlinks

```bash
stow .
```
