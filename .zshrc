
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

## zshの補完定義ファイルの読み込み準備
#
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

## zshのalias読み込み
#
[ -f ~/.zalias ] && . ~/.zalias

## zshのcolor読み込み
#
[ -f ~/.zcolors ] && . ~/.zcolors

## zshの基本的な補完機能
#
autoload -U compinit
compinit

## zshの基本的な塗装機能
#
autoload -U colors
colors

## ターミナルのタイトル
#
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST}\007"
    }
    ;;
esac

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
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

## プロンプトの表示
#
# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
#
PROMPT='%{${fg[cyan]}%}%~%{${reset_color}%}
[%n]%1(v|%F{green}%1v%f|)$ '

## cdの履歴機能
#
# cd - <tab key> で歴史を辿れる
setopt auto_pushd

## beep音を殺す
#
setopt nolistbeep
setopt nobeep

## コマンド履歴の保存数
#
HISTFILE=~/.zsh_history
HISTSIZE=5000000
SAVEHIST=5000000
# 全シェルでコマンドを共有する
setopt share_history
# 補完時に履歴を自動的に展開する
setopt hist_expand
