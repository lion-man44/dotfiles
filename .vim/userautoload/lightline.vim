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

" ホントはこんな関数定義しなくても呼べなきゃダメ
" 今の現状だと読み込みタイミングの問題か何かでlightlineがupdateが中途半端
function CallLightline()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
