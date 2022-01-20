# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load what basic files {{{

[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.bcolors ] && . ~/.bcolors

if [ -e /usr/share/bash-completion ]; then
  source /usr/share/bash-completion/bash_completion
  source /usr/share/bash-completion/completions/git
fi

if [ -e /etc/bash_completion.d ]; then
  source /etc/bash_completion.d/git-prompt
fi

# }}}

# Basic section {{{

export TERM=xterm-256color

## Set type of characters that the readline library treats as delimiters
## for word completion
COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# }}}

# History section {{{

HISTSIZE=600000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# }}}


# Complement section {{{

## colorize the man command
export MANPAGER="less -R"
man() {
  env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
  LESS_TERMCAP_md=$(printf "\e[1;31m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
  man "$@"
}

## For npm command
eval $(npm completion)

# }}}


# Display section {{{

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1="[\e[32;1m\]\u\[\e[33;1m\]@\h \e[00m\]$(parse_git_branch) \e[00m\]\e[36m\]\w\e[00m\]\e[33m\]\e[00m\]]\n\$ "

# }}}

