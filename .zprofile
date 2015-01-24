## 環境変数PATHへのコマンドパスの追加
#
export PATH=/usr/local/bin:$PATH

## 環境変数系
# 
[[ -s "$HOME/dotfiles/zenv" ]] && source "$HOME/dotfiles/zenv"

## rbenvのパス設定
#
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl` --with-readline-dir=`brew --prefix readline`"
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

## gem path
#
export PATH=$HOME/.gem/ruby/2.1.0/bin:$HOME/.gem/ruby/2.2.0/bin:$PATH

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

## Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# export COCOS_CONSOLE_ROOT=$HOME/Downloads/cocos2d-x-3.0/tools/cocos2d-console/bin
# export PATH=$COCOS_CONSOLE_ROOT:$PATH
## 2系 cocos2d-x
# export COCOS2DX_ROOT=$HOME/Downloads/cocos2d-x-3.0
## ANT root
#export ANT_ROOT=/usr/local/bin
## NDK root
#export NDK_ROOT=$HOME/Downloads/android-ndk-r9b
#export PATH=$NDK_ROOT:$PATH
## SDK root
#export ANDROID_SDK_ROOT=$HOME/Downloads/adt-bundle-mac-x86_64-20140321/sdk
#export ANDROID_HOME=$ANDROID_SDK_ROOT
#export PATH=$ANDROID_SDK_ROOT:$PATH
## Android and adb command
#export PATH=$ANDROID_SDK_ROOT/tools:$PATH
#export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

# java_home
export JAVA_HOME=`/usr/libexec/java_home`

# python path
export PYTHONPATH=/usr/local/lib/python2.7/site-packages

# enforce path
export PATH=/Development/js_work/enforce/enforce/bin:$PATH

# pkg-config
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig
