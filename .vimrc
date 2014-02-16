let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle/')
let s:user_setting_root = s:bundle_root . '/userautoload/'
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
  " Neobundleが存在しない、またはvimのversionが古い場合はプラグインを一切読み込まない
  let s:noplugin = 1
else
  " プラグイン管理(NeoBundle)
  filetype off
  if has('vim_starting')
    set rtp+=~/.vim/bundle/neobundle.vim
  endif
  call neobundle#rc(s:bundle_root)
  " Neobundle自身をNeobundle管理下におく
  NeoBundleFetch 'Shougo/neobundle.vim'

  " JSのsyntax
  NeoBundle 'jelera/vim-javascript-syntax'
  " vim上で行う言語等のコマンド補完
  NeoBundle 'Shougo/neocomplcache.vim'
  " スニペット集
  NeoBundle 'Shougo/neosnippet.vim'
  " neocomplcacheを更に賢くオムニ補完してくれる
  NeoBundle 'https://bitbucket.org/teramako/jscomplete-vim'
  " omni補完のnode.jsバージョン
  NeoBundle 'myhere/vim-nodejs-complete'
  " 現在のzen-coding
  NeoBundle 'mattn/emmet-vim'
  " 味気ないlaststatusをかっこ良くしてくれる現在の人気
  NeoBundle 'itchyny/lightline.vim', {'type': 'nosync'}

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
  " JSONカラーリング
  NeoBundle 'elzr/vim-json'
  " 自前のvimプラグイン、管理プラグイン
  NeoBundle 'tpope/vim-pathogen'
  " 環境させ入っていれば、勝手にチェックを走らせてくれるプラグイン
  NeoBundle 'scrooloose/syntastic'
  " webブラウザ
  NeoBundle 'yuratomo/w3m.vim'
  " css3のsyntax
  NeoBundle 'hail2u/vim-css3-syntax'
  " sass,scssのcompile
  NeoBundle 'AtsushiM/sass-compile.vim'
  " html5のindentとsyntaxを追加
  NeoBundle 'taichouchou2/html5.vim'

  " インストールされていないプラグインのチェック
  NeoBundleCheck
  filetype plugin indent on

  execute pathogen#infect()

  " 分割した設定ファイルを全て読み込む
  set rtp^=~/.vim
  set rtp+=s:user_setting_root
  runtime! userautoload/*.vim
endif
