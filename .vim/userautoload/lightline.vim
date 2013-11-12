" lightlineのカラー設定
if !has('gui_running')
  set t_Co=256
endif
" laststatusのカラースキーマ
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \  'hello': 'hello, world'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂'},
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
