let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle/')
let s:user_setting_root = '~/.vim/userautoload/'
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

  " pythonのシンタックスチェッカー
  NeoBundle 'tell-k/vim-autopep8'

  " neocomplcacheを更に賢くオムニ補完してくれる
  NeoBundle 'marijnh/tern_for_vim', {
        \ 'build': {
        \   'others': 'npm install'
        \ }}
  " omni補完のnode.jsバージョン
  NeoBundle 'myhere/vim-nodejs-complete'

  " ctagsの結果をアウトラインして表示する
  NeoBundle 'vim-scripts/taglist.vim'

  " F#用のsyntax
  NeoBundle 'kongo2002/fsharp-vim'

  " 英語から日本語翻訳
  NeoBundle 'mattn/googletranslate-vim'

  " インストールされていないプラグインのチェック
  NeoBundleCheck
  filetype plugin indent on

  " 分割した設定ファイルを全て読み込む

  set rtp^=~/.vim
  set rtp+=s:user_setting_root
  runtime! userautoload/*.vim
endif
