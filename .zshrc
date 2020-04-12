# プロンプトが表示されるたびにプロンプト文字列を評価、置換する {{{

setopt prompt_subst
setopt noflowcontrol

# }}}


# zshの補完定義ファイルの読み込み準備 {{{

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# }}}

# 個別の環境変数などの読み込み {{{

[ -f ~/.zalias ] && . ~/.ztokens

# }}}

# zshのalias読み込み {{{

[ -f ~/.zalias ] && . ~/.zalias

# }}}

# zshのcolor読み込み {{{

[ -f ~/.zcolors ] && . ~/.zcolors

# }}}

# zshの基本的な補完機能 {{{

autoload -U compinit
compinit

# }}}

# 前回のコマンドラインの結果を全選択できる機能(Iterm2専用) {{{

[ -f ~/dotfiles/iterm2_shell_integration.zsh ] && . ~/dotfiles/iterm2_shell_integration.zsh

# }}}

# コマンドの補完{{{

source <(kubectl completion zsh)
source <(minikube completion zsh)

# }}}

# zshの基本的な塗装機能 {{{

autoload -U colors
colors

# }}}

# word-chars で指定した文字が単語の区切りとみなされる。
# M-f, M-b, ^w などの動作に影響する {{{

#autoload -Uz select-word-style
#select-word-style default
#zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|.'
#zstyle ':zle:*' word-style unspecified

# }}}

# ターミナルのタイトル {{{

case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST}\007"
    }
    ;;
esac

# }}}

# VCSの情報を取得するzshの便利関数 vcs_infoを使う {{{

autoload -Uz vcs_info

# }}}

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
# {{{

zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

node_version() {
    NODE_VERSION = `ls -l $NODEBREW_ROOT | egrep -o "v[0-9\.]+"`
    if [ -n $NODE_VERSION ]; then
      echo "%{$fg[yellow]%}[node-$NODE_VERSION]%{$reset_color}"
    fi
}

# }}}

# プロンプトの表示
# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
# {{{

PROMPT='%{${fg[cyan]}%}%~%{${reset_color}%}
[%n]%1(v|%F{green}%1v%f|)$ ' # %nに戻す

# }}}

# cdの履歴機能
# cd - <tab key> で歴史を辿れる
# {{{

setopt auto_pushd

# }}}

# beep音を殺す {{{

setopt nolistbeep
setopt nobeep

# }}}

# コマンド履歴の保存数 {{{

HISTFILE=~/.zsh_history
HISTSIZE=5000000
SAVEHIST=5000000

# }}}

# 全シェルでコマンドを共有する {{{

setopt share_history

# }}}

# 補完時に履歴を自動的に展開する {{{

setopt hist_expand

# }}}

# vi f/F 相当の機能をzsh, bashでも提供する {{{

bindkey '^]'   vi-find-next-char
bindkey '^[^]' vi-find-prev-char

# }}}

# less command color {{{

export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

# }}}

# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#
# {{{

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi

# }}}

# gulp sub-command completion {{{

# eval "$(gulp --completion=zsh)"

# }}}

# history検索にpecoを使うかどうか {{{

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# }}}

# zsh no matches found alertを切る
# http://shirusu-ni-tarazu.hatenablog.jp/entry/2013/01/18/034233
# {{{

setopt nonomatch

# }}}

# homebrew editor {{{

export HOMEBREW_EDITOR='vim'

# }}}

# zsh auto suggestions {{{

source $(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# zle-line-init() {
#   zle autosuggest-start
# }
# zle -N zle-line-init

# }}}

# Rust and cargo read PATH for rustup {{{

# source ~/.cargo/env
# fpath+=~/dotfiles/.zfunc/rustup
# fpath+=~/dotfiles/.zfunc/diesel
# export RUST_BACKTRACE=1
# export OPENSSL_INCLUDE_DIR=$(brew --prefix openssl)/include
# export DEP_OPENSSL_INCLUDE=$(brew --prefix openssl)/include

# }}}

# C-d でターミナルを閉じない {{{

stty eof undef

# }}}

# gloogle cloud sdk の COMMAND PATH {{{

[ -d /usr/local/Caskroom/google-cloud-sdk ] && . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
[ -d /usr/local/Caskroom/google-cloud-sdk ] && . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# }}}

# pet command line snipet {{{

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
bindkey '^s' pet-select

# }}}

