if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi

# envars

export GOROOT="$HOME/golang/go"
export GOPATH="$HOME/golang/workspace"
export PATH="$PATH:$HOME/local/bin:$HOME/bin:$GOROOT/bin:$GOPATH/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"


# visuals

GRAY="\[\033[1;30m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[00m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"

git_parse_dirty()
{
    if [[ -n $(git status -s 2> /dev/null) ]]; then
        echo "$RED"
    else
        echo "$GREEN"
    fi
}

parse_git_branch() {
     echo "$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
}

usrhost()
{
    echo "$GRAY\u@\h"
}

git_prompt(){
    echo "$CYAN\w$(git_parse_dirty)$(parse_git_branch)"
}

cmd_return_code(){
    echo "\$(rc=\$? && if [ \$rc -eq 0 ]; then echo \"$WHITE[\$rc]\"; else echo \"$YELLOW[\$rc]\"; fi)"
}

suffix_prompt(){
    echo "\n $(cmd_return_code) $WHITE$"
}

PROMPT_COMMAND='PS1="$(usrhost) $(git_prompt) $(suffix_prompt) "'
