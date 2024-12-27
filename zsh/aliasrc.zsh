# .zshrc contents for shortcuts (i.e. aliases and functions). This file should 
# be source'd into ~/.zshrc (unless I've chosen to change the dotdir for zsh).

# (TODO: add more aliases/functions for common git and aws-vault commands)
# TODO: the aliases that go into `~/.config` are technically wrong, the real 
# configuration stuff is stored inside of our dotfiles and then moved into 
# the right directories whenever we install. Think about that and fix it!

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
alias misc="vim ~/.config/zsh/misc.zsh"
alias kc="vim ~/.config/kitty/kitty.conf"

# Trying out `eza` instead of `ls` -- seems like a pretty legit option
alias ls="eza --icons=auto"
alias tree="eza --tree"

# Functions
# ---------------

weather() {
    city="$1"
    if [[ -z city ]];
    then
        city="hempstead_ny"
    fi

    eval "curl http://wttr.in/${city}"
}

pdf() {
    eval "/usr/local/lib/node_modules/afterwriting/awc.js --source $1 --pdf $2"
}

pr() {
    git push -u origin $(branch_name)
}

prl() {
    open "$(pr_url)"
}

branch_name() {
    echo $(git branch --show-current 2>/dev/null || echo "")
}

org_name() {
    local org
    org=$(git config --get remote.origin.url 2>/dev/null | awk -F'[:/]' '{print $(NF-1)}')
    echo "$org"  # Will print an empty string if no organization is found
}

repo_name() {
    local repo
    repo=$(git config --get remote.origin.url 2>/dev/null | awk -F'[/]' '{print $NF}' | sed 's/.git$//')
    echo "$repo"  # Will print an empty string if no repository is found
}

pr_url() {
    echo "https://github.com/$(org_name)/$(repo_name)/pull/new/$(branch_name)"
}
