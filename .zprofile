## 環境変数PATHへのコマンドパスの追加
#
export PATH=/usr/local/bin:$PATH

## rbenvのパス設定
#
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl` --with-readline-dir=`brew --prefix readline`"
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

## node.jsのバージョン管理ツール、npmの読み込み
#
export PATH=$PATH:$HOME/.nodebrew/current/bin
export NODEBREW_ROOT=$HOME/.nodebrew

## postgresqlの環境パス
#
export PGDATA=/usr/local/var/postgres

## pythonのバージョン管理ツールの設定ファイル読み込み
# 
#export PATH=$PATH:/usr/local/opt/pyenv/bin
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

## perlのバージョン管理ツール、plenvのPATH通し
#
export PATH=$HOME/.plenv/bin:$PATH
eval "$(plenv init -)"
export PERL5LIB=$HOME/.plenv/versions/5.16.3/lib/perl5:$PERL5LIB

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
