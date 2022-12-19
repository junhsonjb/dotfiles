# .zshrc contents for completion (tabbing, git, etc.). This file should be 
# source'd into ~/.zshrc (unless I've chosen to change the dotdir for zsh).

# Load Git Completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit
