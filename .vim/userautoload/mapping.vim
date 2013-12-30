" insertモードから抜ける
inoremap <silent> jj <Esc>
" visualモードから抜ける
vnoremap <silent> q <Esc>

" Esc2回でハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

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
