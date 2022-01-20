#! /bin/sh

# Get the aliases and functions
[ -f ~/.bashrc ] && source ~/.bashrc
[ -f ~/.tokens ] && source ~/.tokens

# rbenvの設定
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
