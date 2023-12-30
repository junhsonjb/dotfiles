#!/usr/bin/env zsh

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# zsh
ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc

# neovim
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

# kitty
rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

# tmux
ln -sf $DOTFILES/tmux $HOME/.config/tmux

# todo
# - git configs (?)
# - auto install nvim dependencies (icons, etc.)
