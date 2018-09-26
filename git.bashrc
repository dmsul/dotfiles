alias ls="ls --color=always -h"
alias ll="ls -l"
# PS1="[\A \h \W]\$"

#export DISPLAY=Server:0.0

# So `latexmk` uses system perl instead of msys perl
export PATH=/c/Strawberry/perl/bin:$PATH
# So git bash uses system vim
export PATH="/c/Program Files/vim/vim81":$PATH

alias gitmm="git branch | grep \* | cut -d ' ' -f2 | xargs -I {} bash -c 'git ch master && git merge --no-ff {} && git branch -d {}' "
