# shortcut key for shell {{{

bindkey -e

# }}}

# zsh auto suggestions {{{

if [ `uname -m` = "arm64" ]; then
  export PATH=$PATH:/opt/homebrew/bin
  export PATH=$PATH:$(brew --prefix bison)/bin
fi
source $(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# }}}

# 前回のコマンドラインの結果を全選択できる機能(Iterm2専用) {{{

[ -f /Applications/iTerm.app/Contents/Resources/iterm2_shell_integration.zsh ] && . /Applications/iTerm.app/Contents/Resources/iterm2_shell_integration.zsh

# }}}

# この環境だけのもの {{{

[ -f ~/.ztokens ] && . ~/.ztokens

# }}}

## Default editor {{{

export EDITOR=vim
export HOMEBREW_EDITOR=vim

# }}}

## 環境変数PATHへのコマンドパスの追加 {{{

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin

# }}}

# git diff-highlight {{{

export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

# }}}

## rbenvのパス設定 {{{

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl` --with-readline-dir=`brew --prefix readline`"
export PATH=$PATH:$HOME/.rbenv/bin
eval "$(rbenv init -)"

# }}}

## node.jsのバージョン管理ツール、npmの読み込み {{{

export N_PREFIX=$HOME/.n
export PATH=$PATH:$N_PREFIX/bin

# }}}

## postgresqlの環境パス {{{

export PGDATA=/usr/local/var/postgres

# }}}

# gloogle cloud sdk の COMMAND PATH {{{

[ -d /usr/local/Caskroom/google-cloud-sdk ] && . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
[ -d /usr/local/Caskroom/google-cloud-sdk ] && . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

export CLOUDSDK_PYTHON=python2

# }}}

# java_home {{{

export JAVA_HOME=`/usr/libexec/java_home`

# }}}

# Go path {{{

export GOPATH=$HOME/dev/go
export GOBIN=$GOPATH/bin

export GOENV_ROOT=$HOME/.goenv
export PATH=$PATH:$GOENV_ROOT/bin

export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN

# }}}

# Rust path {{{

export PATH=$PATH:$HOME/.cargo/bin

# }}}

# Flutter path {{{

[ -d $HOME/dev/mobile/flutter ] && export PATH=$PATH:$HOME/dev/mobile/flutter/bin

# }}}

# Deno path {{{

export PATH=$PATH:$HOME/.deno/bin

# }}}
