# .zshrc contents for miscellaneous things (history, bindings, etc.).  
# This file should be source'd into ~/.zshrc (unless I've chosen to change the
# dotdir for zsh).

# History in cache directory:
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# vi mode
bindkey -v
export KEYTIMEOUT=1

# enable reverse search
# (commented out since I'm using fzf's history seach, but keeping 
# this here in case I ever want to switch back)
# bindkey '^R' history-incremental-search-backward

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

