# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PATH=$PATH:$HOME/bin

# rbenvの設定
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodebrewの設定
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=$HOME/.nodebrew

# node pathの設定
export NODE_PATH=$NODEBREW_ROOT/current

# npm installの-g install先のpath設定
