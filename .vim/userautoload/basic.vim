" カラー機能
syntax on

" .swpファイルを作成しない
set noswapfile

" 制御シーケンスの変更
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" beep音殺す
set vb t_vb=

" タブをスペースに変換
set expandtab

" タブのインデント数
set ts=2
" インデントの各段階に使われる空白数
set sw=2

" オートインデント無効
set noautoindent
set nosmartindent

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" vimコマンドラインの補完候補を表示
set wildmenu

" 検索文字をハイライト
set hlsearch

" 入力中のコマンドを表示
set showcmd

" 全角スペースの定義
hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue
" 全角スペースの色変更
match 	ZenkakuSpace /　/

" ステータスラインを2行
set laststatus=2
set statusline=%<%f\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P

" エンコード、charset
set termencoding=utf-8
set encoding=utf-8
set fenc=utf-8
set ffs=unix,dos,mac
" UTF-8の表示出来ない文字で位置ずれしないよう設定
if exists('&ambiwidth')
  set ambiwidth=double
endif
