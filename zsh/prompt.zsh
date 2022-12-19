# .zshrc contents for configuring the prompt. This file should be 
# source'd into ~/.zshrc (unless I've chosen to change the dotdir for zsh).

# stuff for loading/formatting vcs info
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'

# Allow substitution in prompt string
setopt PROMPT_SUBST

# TODO: maybe put a random emoji next to indicator? Sounds fun! Pls do this!

username() {
    echo '%F{012}%n%f'
}

directory() {
    echo '%F{cyan}%2~%f'
}

branch() {
    BRANCH="$vcs_info_msg_0_"
    if [ -z "$BRANCH" ]
    then
        echo ''
    else
        # TODO: take the logic for setting `DIRTY` and put into its own fcn
        STATUS=$(command git status --porcelain 2> /dev/null | tail -n 1)
        if [ -n "$STATUS" ]
        then
            DIRTY="*"
        else
            DIRTY=""
        fi
        echo "%F{magenta}on $BRANCH$DIRTY%f"
    fi
}

terraform_info() {
    if [[ -d .terraform && -r .terraform/environment ]]; then
        WORKSPACE=$(cat .terraform/environment)
        echo "%F{012}[$WORKSPACE]%f"
    fi
}

indicator() {
    echo "%B%F{red}%f%b "
}

time_now() {
    echo "%F{yellow}%t%f"
}

PROMPT='%B$(directory) $(branch) $(terraform_info)%b'$'\n''$(indicator)'
# TODO: is there a way to do an RPROMPT that is on the same line as the prompt
# (when prompt string has a line break)?
