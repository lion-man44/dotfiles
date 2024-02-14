# shortcut key for shell {{{

bindkey -e

# }}}

# LC_* {{{

export LC_CTYPE=en_US.UTF-8
export LESSCHARSET=UTF-8

# }}}

# zsh auto suggestions {{{

if [ `uname -m` = "arm64" ]; then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=$(brew --prefix bison)/bin:$PATH
fi
source $(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# }}}

# 前回のコマンドラインの結果を全選択できる機能(Iterm2専用) {{{

[ -f /Applications/iTerm.app/Contents/Resources/iterm2_shell_integration.zsh ] && . /Applications/iTerm.app/Contents/Resources/iterm2_shell_integration.zsh

# }}}

# この環境だけのもの {{{

[ -f ~/.tokens ] && . ~/.tokens

# }}}

## Default editor {{{

export EDITOR=vim
export HOMEBREW_EDITOR=vim

# }}}

## 環境変数PATHへのコマンドパスの追加 {{{

export PATH=/usr/local/bin:$PATH
#export PATH=/usr/local/sbin:$PATH

# }}}

# git diff-highlight {{{

export PATH=$(brew --prefix git)/share/git-core/contrib/diff-highlight:$PATH

# }}}

## rbenvのパス設定 {{{

eval "$(rbenv init -)"

# }}}

## node.jsのバージョン管理ツール、npmの読み込み {{{

export VOLTA_HOME=$HOME/.volta
export PATH=$VOLTA_HOME/bin:$PATH

# }}}

## For databases path {{{

export PGDATA=/usr/local/var/postgres

export PATH=$(brew --prefix mysql@5.7)/bin:$PATH
export PATH=$(brew --prefix redis)/bin:$PATH

# }}}

# gloogle cloud sdk の COMMAND PATH {{{

source $(brew --caskroom google-cloud-sdk)/latest/google-cloud-sdk/completion.zsh.inc
source $(brew --caskroom google-cloud-sdk)/latest/google-cloud-sdk/path.zsh.inc

# }}}

# java_home {{{

export JAVA_HOME=$(brew --prefix openjdk)/libexec/openjdk.jdk/Contents/Home

# }}}

# Go path {{{

export GOPATH=$HOME/dev/go
export GOBIN=$GOPATH/bin

export PATH=$GOROOT/bin:$PATH
export PATH=$GOBIN:$PATH

# }}}

# Rust path {{{

export PATH=$HOME/.cargo/bin:$PATH

# }}}

# Flutter path {{{

[ -d $HOME/dev/mobile/flutter ] && export PATH=$HOME/dev/mobile/flutter/bin:$PATH
export PATH=$HOME/fvm/default/bin:$PATH

# }}}

# Deno関係 {{{

export PATH=$HOME/.deno/bin:$PATH

# }}}

# OrbStack {{{

source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# }}}
