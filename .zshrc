#!/bin/zsh
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する {{{

setopt prompt_subst
setopt noflowcontrol

# }}}

# zshの補完定義ファイルの読み込み準備 {{{

fpath=($HOME/.zfunc/ $fpath)

# }}}

# 個別の環境変数などの読み込み {{{

[ -f ~/.ztokens ] && . ~/.ztokens

# }}}

# zshのalias読み込み {{{

[ -f ~/.zalias ] && . ~/.zalias

# }}}

# zshのcolor読み込み {{{

[ -f ~/.zcolors ] && . ~/.zcolors

# }}}

# moduleが使う関数などの読み込み {{{

[ -f ~/.zscript ] && . ~/.zscript

# }}}

# zshの基本的な補完機能 {{{


autoload -U compinit
compinit

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

# zsh no matches found alertを切る
# http://shirusu-ni-tarazu.hatenablog.jp/entry/2013/01/18/034233
# {{{

setopt nonomatch

# }}}

# C-d でターミナルを閉じない {{{

stty eof undef

# }}}
