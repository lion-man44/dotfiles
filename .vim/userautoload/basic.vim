" 基本設定
" カラー機能
"colorscheme molokai
syntax on
" .swpファイルを作成しない
set noswapfile
" backupファイルを作成しない
set nobackup
set nowritebackup
" beep音殺す
set vb t_vb=
" 行数を表示するスペースの領域を設定
set nuw=3
" 8進数扱いを止める(007のインクリメントなど)
set nf=
" system .gvimrcが上書きするのを止める
"set noimdisableactivate
" '<'や'>'でインデントする際にshiftwidthの倍数に丸める
set shiftround
" vimDiffの色変え
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7


" エンコード関係
" エンコード、charset
set termencoding=utf-8
set encoding=utf-8
set fenc=utf-8
"scriptencoding utf-8


" 表示関係
" 全角スペースの定義
hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue
" 全角スペースの色変更
match 	ZenkakuSpace /　/
" UTF-8の表示出来ない文字で位置ずれしないよう設定
if exists('&ambiwidth')
  set ambiwidth=double
endif
" デフォルト不過視文字は美しくないので美しく
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲


" ファイル関係
" ファイルフォーマットの設定
set ffs=unix,dos,mac


" カーソル制御関係
" 制御シーケンスの変更
"let &t_ti.="\e]1 q"
let &t_SI.="\e]50;CursorShape=1\x7"
let &t_EI.="\e]50;CursorShape=0\x7"
"let &t_te.="\e]0 q"
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]


" 基本タブ設定
" タブをスペースに変換
set expandtab
" タブのインデント数
set ts=2
" インデントの各段階に使われる空白数
set sw=2


" Vimコマンド関係
" 入力中のコマンドを表示
set showcmd
" vimコマンドラインの補完候補を表示
set wildmenu
" ステータスラインを2行
set laststatus=2
"set statusline=%<%f\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P

" 検索関係
" 検索文字をハイライト
set hlsearch
" バックスラッシュ・クエスチョンを自動的にエスケープ
"cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
"cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
