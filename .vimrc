if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

let g:dein#install_github_api_token = $GITHUB_PERSONAL_TOKEN

if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " editorconfig
  call dein#add('editorconfig/editorconfig-vim')

  " JSのsyntax
  call dein#add('jelera/vim-javascript-syntax')

  " 現在のzen-coding
  call dein#add('mattn/emmet-vim')
  " 味気ないlaststatusをかっこ良くしてくれる現在の人気
  call dein#add('itchyny/lightline.vim')

  " JSONカラーリング
  call dein#add('elzr/vim-json')
  " css3のsyntax
  call dein#add('hail2u/vim-css3-syntax')

  " slimのsyntax
  call dein#add('slim-template/vim-slim')

  " rails使いの定番
  call dein#add('tpope/vim-rails')

  " 高速ファイラー
  call dein#add('kien/ctrlp.vim')

  " vimgrepなどをagコマンドでやる
  call dein#add('rking/ag.vim')

  " highlight for vue
  call dein#add('posva/vim-vue')

  " html5のindentとsyntaxを追加
  call dein#add('othree/html5.vim')
  " high performance for golang
  call dein#add('fatih/vim-go')

  call dein#add('aklt/plantuml-syntax')

  call dein#add('leafgarland/typescript-vim')
  call dein#add('peitalin/vim-jsx-typescript')

  call dein#add('weirongxu/plantuml-previewer.vim')
  call dein#add('tyru/open-browser.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable


if dein#check_install()
  call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

" call dein#check_update(v:true)
" call dein#update('dein.vim')

"End dein Scripts-------------------------


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" カラー機能
colorscheme molokai
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
" デフォルトで空白文字をハイライトする
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
" バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin で発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre   *.bin let &binary =1
  autocmd BufReadPost  * if &binary | silent %!xxd -g 1
  autocmd BufReadPost  * set ft=xxd | endif
  autocmd BufWritePre  * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END


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
" バックスペースで削除できるものを定義
set backspace=indent,eol,start

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
" 補完のスタイル
set wildmode=list:full
" ステータスラインを2行
set laststatus=2
"set statusline=%<%f\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P

" 検索関係
" 検索文字をハイライト
set hlsearch
" バックスラッシュ・クエスチョンを自動的にエスケープ
"cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
"cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" ヤンクの行数を増やす
set viminfo='20,\"5000

" matchit.vimの導入
source $VIMRUNTIME/macros/matchit.vim
source ~/.vim/bundle/repos/github.com/othree/html5.vim/autoload/htmlcomplete.vim
let b:match_words = '<:>,<div.*>:</div>'

" 前に開いたファイルのラインを記憶する
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ファイル設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " 改行時にコメントしない
  " 改行時に勝手にインデントしない
  autocmd FileType * setlocal formatoptions-=ro noautoindent nosmartindent

  " ファイル種別による個別設定(初期設定ではexpandtabなのでその設定はいれない)
  " ts = tabstop, sts = softtabstop, sw = shiftwidth, tw = textwidth
  " ft = filetype
  autocmd FileType html,xhtml,css,yaml,ruby,javascript,coffee,typescript setlocal ts=2 sts=2 sw=2
  autocmd FileType python setlocal ts=4 sts=4 sw=4

  " ファイルを開いた時、読み込んだ時にファイルタイプを設定する
  autocmd BufNewFile,BufRead *.js setlocal ft=javascript
  autocmd BufNewFile,BufRead *.es6 setlocal ft=javascript
  autocmd BufNewFile,BufRead *.ejs setlocal ft=html
  autocmd BufNewFile,BufRead *.tera setlocal ft=html
  autocmd BufNewFile,BufRead *.py setlocal ft=python
  autocmd BufNewFile,BufRead *.rb setlocal ft=ruby
  autocmd BufNewFile,BufRead Gemfile setlocal ft=ruby
  autocmd BufNewFile,BufRead *.coffee setlocal ft=coffee
  autocmd BufNewFile,BufRead *.ts setlocal ft=typescript
  autocmd BufNewFile,BufRead *.md setlocal ft=markdown
  autocmd BufNewFile,BufRead *.pug setlocal ft=pug
  autocmd BufNewFile,BufRead *.amber setlocal ft=amber
  autocmd BufNewFile,BufRead *.gyp setlocal ft=json
  autocmd BufNewFile,BufRead *.cson setlocal ft=json
  autocmd BufNewFile,BufRead *.yml setlocal ft=yaml
  autocmd BufNewFile,BufRead *.yaml setlocal ft=yaml
  autocmd BufNewFile,BufRead *.php setlocal ft=php
  autocmd BufNewFile,BufRead *.ts setlocal ft=typescript
  autocmd BufNewFile,BufRead *.rs setlocal ft=rust
  autocmd BufNewFile,BufRead *.dart setlocal ft=dart
  autocmd BufNewFile,BufRead ~/.zfunc/* :setlocal ft=zsh

endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mapping設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" insertモードから抜ける
inoremap <silent> jj <Esc>
vnoremap <silent> q <Esc>

" Esc2回でハイライトを消す
nnoremap <Esc><Esc> qq :nohlsearch<CR><Esc>

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 行移動を見た目上に移動する
noremap j gj
noremap k gk

" 全てのマッピングの表示
command!
\ -nargs=* -complete=mapping
\ AllMaps
\ map <args> | map! <args> | lmap <args>

" ctagsで複数候補のある時は一覧で表示
nnoremap <C-]> g<C-]>

" 前/後のファイルに移動
noremap <silent> bp :bprevious<CR>
noremap <silent> bn :bnext<CR>

" sの無効化
nnoremap s <Nop>

" 検索のescapeを簡略化
nnoremap / /\v


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dein.vim設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" DeinClean command
command! -bang DeinClean call s:dein_clean(<bang>0)

function! s:dein_clean(force) abort "{{{
  let del_all = a:force
  for p in dein#check_clean()
    if !del_all
      let answer = s:input(printf('Delete %s ? [y/N/a]', fnamemodify(p, ':~')))

      if type(answer) is type(0) && answer <= 0
        " Cancel (Esc or <C-c>)
        break
      endif

      if answer !~? '^\(y\%[es]\|a\%[ll]\)$'
        continue
      endif

      if answer =~? '^a\%[ll]$'
        let del_all = 1
      endif
    endif

    " Delete plugin dir
    call dein#install#_rm(p)
  endfor
endfunction "}}}

function! s:input(...) abort "{{{
  new
  cnoremap <buffer> <Esc> __CANCELED__<CR>
  try
    let input = call('input', a:000)
    let input = input =~# '__CANCELED__$' ? 0 : input
  catch /^Vim:Interrupt$/
    let input = -1
  finally
    bwipeout!
    return input
  endtry
endfunction "}}}




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightlineのカラー設定
if !has('gui_running')
  set t_Co=256
endif
" laststatusのカラースキーマ
" let g:lightline = {
"   \ 'colorscheme': 'powerline',
"   \ }



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag入ってたらagで検索させる
" ついでにキャッシュファイルからの検索もさせない
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_settings = {
      \ 'lang': 'ja'
      \ }



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_template_autocreate = 0
autocmd BufWritePost *.go execute 'GoFmt'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CurrentFile()
  echo expand('%:p')
endfunction
command! CurrentFile :call CurrentFile()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plantuml 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:plantuml_previewersave_format = 'svg'
