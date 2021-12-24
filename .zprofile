# shortcut key for shell {{{

bindkey -e

# }}}

# zsh auto suggestions {{{

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

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# }}}

# git diff-highlight {{{

export PATH=/usr/local/share/git-core/contrib/diff-highlight:$PATH

# }}}

## rbenvのパス設定 {{{

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl` --with-readline-dir=`brew --prefix readline`"
export PATH=$HOME/.rbenv/bin:$PATH
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
export GOBIN=$HOME/dev/go/bin
export PATH=$GOBIN:$PATH

# }}}

# Rust path {{{

export PATH="$HOME/.cargo/bin:$PATH"

# }}}

# Flutter path {{{

[ -d $HOME/dev/mobile/flutter ] && export PATH=$HOME/dev/mobile/flutter/bin:$PATH

# }}}

# Deno path {{{

export PATH=$HOME/.cret/bin:$PATH
export PATH=$HOME/.deno/bin:$PATH

# }}}
