#!/usr/bin/env zsh

# This line, for some reason, was setting DOTFILES to the same value as $HOME 
# and not the dotfiles directory. TODO: fix that
# DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOTFILES="$HOME/.dotfiles"

create_symlink() {
	local source=$1
	local target=$2

	if [ -e "$target" ] || [ -L "$target" ]; then
		echo "Removing existing file or directory: $target"
		rm -rf "$target"
	fi
	ln -s "$source" "$target"
}

install_program() {
	local program_name=$1
	local install_function=$2

	if ! command -v "$program_name" &>/dev/null; then
		echo "$program_name is not installed. Installing..."
		"$install_function"
	else
		echo "$program_name is already installed."
	fi
}

install_neovim() {
	echo "Installing neovim..."
	brew install neovim
}

install_tmux() {
	echo "Installing tmux..."
	brew install tmux
}

install_kitty() {
	echo "Instlling kitty..."
	brew install --cask kitty
}

install_ghostty() {
    echo "Installing ghostty..."
    brew install ghostty
}

# zsh
create_symlink "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"

# neovim
install_program "nvim" "install_neovim"
create_symlink "$DOTFILES/nvim" "$HOME/.config/nvim"

# kitty
install_program "kitty" "install_kitty"
create_symlink "$DOTFILES/kitty" "$HOME/.config/kitty"

# tmux
install_program "tmux" "install_tmux"
create_symlink "$DOTFILES/tmux" "$HOME/.config/tmux"

# ghostty
install_program "ghostty" "install_ghostty"
create_symlink "$DOTFILES/ghostty" "$HOME/.config/ghostty"

# todo
# - make it work for non-zsh machines
# - git configs (?)
# - auto install nvim dependencies (icons, etc.)
# - install zsh-syntax-highlighting
# - move $DOTFILES definition to more central place (avoid redundancy -- DRY)
# - auto install stuff:
#   - utilities like eza (`ls` replacement)
#   - fonts you like (current fave is JetBrains Mono)
#   - brew install findutils (so you can have gfind, needed for fzf file searching in nvinm)
#   - install glow
#   - install eza (ls alias dependency)
#   - add more things to install
#   - terminal slideshow application (pick one, leaning towareds presenterm)
#
# ACUTALLY LOOK AT YOUR TODO list and CHECK THINGS OFF BRO
