" 補完候補のポップアップの色設定
" Pmenu アイテムの色 PmenuSel 現在選択中の色 PmenuSbar スクロールバーの色 PmenuThumb スクロールバーの現在位置を示す色
hi Pmenu ctermbg=lightgreen ctermfg=white
hi PmenuSel ctermbg=lightred
hi PmenuSbar ctermbg=black
hi PmenuThumb ctermfg=lightcyan

" 補完ウィンドウ自体の設定
set completeopt=menuone

" neocomplcacheの起動
let g:neocomplcache_enable_at_startup = 1
" 挿入モード時に移動の方をメインに使う人はオススメの設定
let g:neocomplcache_enable_insert_char_pre = 1

" _区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" キャメルケースの補完を有効化
let g:neocomplcache_enable_camel_case_completion = 1

" <C-h>もしくは<BS>を押下時に確実にポップアップを削除
"inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<BS>"
" 現在選択している候補をキャンセルし、確実にポップアップを削除
inoremap <expr><C-e> neocomplcache#cancel_popup() . "\<C-e>"
" 現在選択している候補を確実に確定する
inoremap <expr><C-y> neocomplcache#close_popup() . "\<C-y>"

" JavaScriptのメソッド補完を可能にする設定
let g:jscomplete_use = ['dom', 'moz', 'es6th']

