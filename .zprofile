## 環境変数PATHへのコマンドパスの追加
#
export PATH=/usr/local/bin:$PATH

## rbenvのパス設定
#
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
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
# [[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

