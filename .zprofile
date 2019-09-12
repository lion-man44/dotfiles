## 環境変数PATHへのコマンドパスの追加 {{{

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# }}}

## 環境変数系 {{{

[[ -s "$HOME/dotfiles/zenv" ]] && source "$HOME/dotfiles/zenv"

# }}}

## Homebrew Caskroomのパス設定 {{{

#export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/opt/homebrew-cask/Caskroom"

# }}}

# git command diff-highlight {{{

export PATH=/usr/local/share/git-core/contrib/diff-highlight:$PATH

# }}}

## rbenvのパス設定 {{{

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl` --with-readline-dir=`brew --prefix readline`"
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# gem path
export PATH=$HOME/.gem/ruby/2.6.0/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/.gem/ruby/2.4.0/bin:$PATH
#export PATH=$HOME/.rbenv/shims:$PATH

# }}}



## node.jsのバージョン管理ツール、npmの読み込み {{{

export NODEBREW_ROOT=$HOME/.nodebrew
export PATH=$PATH:$NODEBREW_ROOT/current/bin

# }}}

## postgresqlの環境パス {{{

export PGDATA=/usr/local/var/postgres

# }}}

## pythonのバージョン管理ツールの設定ファイル読み込み {{{

#export PYENV_ROOT=$HOME/.pyenv
#if [ -d $PYENV_ROOT ]; then
#  export PATH=$PYENV_ROOT/bin:$PATH
#  eval "$(pyenv init -)"
#  eval "$(pyenv virtualenv-init -)"
#fi

# }}}

## Added by the Heroku Toolbelt {{{

#export PATH="/usr/local/heroku/bin:$PATH"

# }}}

# java_home {{{

export JAVA_HOME=`/usr/libexec/java_home`

# }}}

# python path {{{

#export PYTHONPATH=/usr/local/lib/python2.7/site-packages

# }}}

# pkg-config {{{

#export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

# }}}

# Haskell用のバージョン管理ツールstackのPATH {{{

# http://docs.haskellstack.org/en/stable/install_and_upgrade/#mac-os-x
#export PATH=$HOME/.local/bin:$PATH

# }}}

# Go path {{{

export GOPATH=$HOME/dev/go
export GOBIN=$HOME/dev/go/bin
export PATH=$GOBIN:$PATH

# }}}

# この環境だけのもの {{{

[ -f ~/.ztokens ] && . ~/.ztokens

# }}}

# Rust path {{{

export PATH="$HOME/.cargo/bin:$PATH"

# }}}
