# .zshrc contents for shortcuts (i.e. aliases and functions). This file should 
# be source'd into ~/.zshrc (unless I've chosen to change the dotdir for zsh).

# (TODO: add more aliases/functions for common git and aws-vault commands)

source ~/.config/zsh/.figma/aliasrc.zsh

# Miscellaneous 
# ---------------
alias cl="clear"
alias shrc="vim ~/.zshrc"
alias src="source ~/.zshrc"
alias vim="nvim"
alias vi="nvim"
alias vconf="vim ~/.config/nvim/init.vim"
alias tconf="vim ~/.config/tmux/tmux.conf"
alias aliasrc="vim ~/.config/zsh/aliasrc.zsh"
alias arc="aliasrc"
alias prompt="vim ~/.config/zsh/prompt.zsh"
alias plugins="vim ~/.config/zsh/plugins.zsh"
alias completion="vim ~/.config/zsh/completion.zsh"
alias misc="vim ~/.config/zsh/misc.zsh"
alias stuff="cd ~/stuff"
alias vpm="cd ~/stuff/notes/velocity-post-mortems"
alias config="cd ~/.config"
alias tortilla="ssh junhson@192.168.1.67"
alias kconf="vim ~/.config/kitty/kitty.conf"
alias kc="kconf"

# Functions
# ---------------

function weather() {
    city="$1"
    if [[ -z city ]];
    then
        city="hempstead_ny"
    fi

    eval "curl http://wttr.in/${city}"
}
