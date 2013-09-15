" プラグイン管理(NeoBundle)
filetype off
if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))
" JSのsyntax
NeoBundle 'jelera/vim-javascript-syntax'
" vim上で行う言語等のコマンド補完
NeoBundle 'Shougo/neocomplcache'
" neocomplcacheを更に賢くオムニ補完してくれる
NeoBundle 'teramako/jscomplete-vim'
" omni補完のnode.jsバージョン
NeoBundle 'myhere/vim-nodejs-complete'
" 現在のzen-coding
NeoBundle 'mattn/emmet-vim'
" スニペット集
NeoBundle 'Shougo/neosnippet'
" 味気ないlaststatusをかっこ良くしてくれる現在の人気
NeoBundle 'itchyny/lightline.vim'
" ちょっとした宗教戦争からユーザが若干離れて行ったプラグインだがまだまだ人気
NeoBundle 'Lokaltog/vim-powerline'
" そのlaststatus上で使うguifontが入っているらしいが使い方がよく分からんくて使ってない
NeoBundle 'Lokaltog/powerline-fonts'
" CoffeeScriptのsyntax
NeoBundle 'kchmck/vim-coffee-script'

" lightlineのカラー設定
if !has('gui_running')
  set t_Co=256
endif

" laststatusのカラースキーマ
let g:lightline = {
  \  'colorscheme': 'solarized',
\  }

" JavaScriptのメソッド補完を可能にする設定
let g:jscomplete_use = ['dom', 'moz', 'es6th']

" 分割した設定ファイルを全て読み込む
set rtp+=~/.vim
runtime! userautoload/*.vim

filetype plugin indent on
