" lightlineのカラー設定
if !has('gui_running')
  set t_Co=256
endif
" laststatusのカラースキーマ
let g:lightline = {
      \ 'separator': { 'left': '⮀', 'right': '⮂'},
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
