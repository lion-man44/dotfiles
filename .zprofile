## 環境変数PATHへのコマンドパスの追加
#
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

## 環境変数系
#
[[ -s "$HOME/dotfiles/zenv" ]] && source "$HOME/dotfiles/zenv"

## Homebrew Caskroomのパス設定
#
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/opt/homebrew-cask/Caskroom"

## rbenvのパス設定
#
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl` --with-readline-dir=`brew --prefix readline`"
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

## gem path
#
export PATH=$HOME/.gem/ruby/2.3.0/bin:$HOME/.gem/ruby/2.4.0/bin:$PATH

## node.jsのバージョン管理ツール、npmの読み込み
#
export PATH=$PATH:$HOME/.nodebrew/current/bin
export NODEBREW_ROOT=$HOME/.nodebrew

## postgresqlの環境パス
#
export PGDATA=/usr/local/var/postgres

## pythonのバージョン管理ツールの設定ファイル読み込み
#
export PYENV_ROOT=$HOME/.pyenv
if [ -d $PYENV_ROOT ]; then
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# java_home
export JAVA_HOME=`/usr/libexec/java_home`

# python path
export PYTHONPATH=/usr/local/lib/python2.7/site-packages

# pkg-config
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

# Haskell用のバージョン管理ツールstackのPATH
# http://docs.haskellstack.org/en/stable/install_and_upgrade/#mac-os-x
export PATH=$HOME/.local/bin:$PATH

# Go path {{{

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$HOME/go/bin:$PATH

# }}}

[ -f ~/.ztokens ] && . ~/.ztokens
