" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" プラグイン管理(NeoBundle)
call neobundle#begin(expand('~/.vim/bundle/'))

" Neobundle自身をNeobundle管理下におく
NeoBundleFetch 'Shougo/neobundle.vim'

" JSのsyntax
NeoBundle 'jelera/vim-javascript-syntax'
" vim上で行う言語等のコマンド補完
NeoBundle 'Shougo/neocomplcache.vim'
" 現在のzen-coding
NeoBundle 'mattn/emmet-vim'
" 味気ないlaststatusをかっこ良くしてくれる現在の人気
NeoBundle 'itchyny/lightline.vim', {'type': 'nosync'}

" CoffeeScriptのsyntax
NeoBundle 'kchmck/vim-coffee-script'

" アウトライン表示
NeoBundle 'Shougo/unite-outline'
" ファイラー
NeoBundle 'Shougo/unite.vim'

" JSONカラーリング
NeoBundle 'elzr/vim-json'
" css3のsyntax
NeoBundle 'hail2u/vim-css3-syntax'
" html5のindentとsyntaxを追加
NeoBundle 'taichouchou2/html5.vim'

" ctagsの結果をアウトラインして表示する
NeoBundle 'vim-scripts/taglist.vim'

" slimのsyntax
NeoBundle 'slim-template/vim-slim'

" rails使いの定番
NeoBundle 'tpope/vim-rails'

" 高速ファイラー
NeoBundle 'kien/ctrlp.vim'

" railsでRTreeをするとプロジェクトツリーを表示してくれる
NeoBundle 'scrooloose/nerdtree'

" ctags
NeoBundle 'szw/vim-tags'

" rubyのif...endやJSの{}等のキーワードを自動補完する
NeoBundle 'kana/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'

" Vim plugin を作成するためのユーティリティー関数群
NeoBundle 'vim-jp/vital.vim'

" pasteする時に自動で :set nopaste and :set noindent などをしてくれる
NeoBundle 'ConradIrwin/vim-bracketed-paste'

" vimgrepなどをagコマンドでやる
NeoBundle 'rking/ag.vim'

" 最高に最高なインクリメンタルサーチ
NeoBundle 'haya14busa/incsearch.vim'

call neobundle#end()
filetype plugin indent on

" インストールされていないプラグインのチェック
NeoBundleCheck

" 分割した設定ファイルを全て読み込む
set rtp^=~/.vim
set rtp+=s:user_setting_root
runtime! userautoload/*.vim
