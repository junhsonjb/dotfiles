# .zshrc contents for miscellaneous things (history, bindings, etc.).  
# This file should be source'd into ~/.zshrc (unless I've chosen to change the
# dotdir for zsh).

# History in cache directory:
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

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

