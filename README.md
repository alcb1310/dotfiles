# My Dotfiles Configuration

## Requirements

Ensure you have the followin installed on your system

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
git clone https://github.com/alcb1310/dfiles.git dotfiles
cd dotfiles
```

then use GNU stow to create the symlinks

```bash
stow .
```
