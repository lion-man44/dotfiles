" プラグイン管理(NeoBundle)
filetype off
if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))
" JSのsyntax
NeoBundle 'jelera/vim-javascript-syntax'
" vim上で行う言語等のコマンド補完
NeoBundle 'Shougo/neocomplcache.vim'
" スニペット集
NeoBundle 'Shougo/neosnippet.vim'
" neocomplcacheを更に賢くオムニ補完してくれる
NeoBundle 'teramako/jscomplete-vim'
" omni補完のnode.jsバージョン
NeoBundle 'myhere/vim-nodejs-complete'
" 現在のzen-coding
NeoBundle 'mattn/emmet-vim'
" 味気ないlaststatusをかっこ良くしてくれる現在の人気
NeoBundle 'itchyny/lightline.vim'
" fontpatcherの為
NeoBundle 'Lokaltog/vim-powerline'
" そのlaststatus上で使うguifontが入っているらしいが使い方がよく分からんくて使ってない
" NeoBundle 'Lokaltog/powerline-fonts'
" CoffeeScriptのsyntax
NeoBundle 'kchmck/vim-coffee-script'

" TweetVimとその依存関係のプラグイン
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/bitly.vim'
" webapiが詰め込まれたvim
NeoBundle 'mattn/webapi-vim'
" ふぁぼ
NeoBundle 'mattn/favstar-vim'
" vimからブラウザを開くプラグイン
NeoBundle 'tyru/open-browser.vim'
" アウトライン表示
NeoBundle 'Shougo/unite-outline'
" ファイラー
NeoBundle 'Shougo/unite.vim'

" フィルター機能
NeoBundle 'rhysd/tweetvim-advanced-filter'
" JSONかラーリング
NeoBundle 'elzr/vim-json'
filetype plugin indent on

" 分割した設定ファイルを全て読み込む
set rtp^=~/.vim
set rtp+=~/.vim/userautoload/
runtime! userautoload/*.vim

"filetype plugin indent on
