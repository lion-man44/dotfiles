" insertモードから抜ける
inoremap <silent> jj <Esc>

" neosnipet内にてsモードに<C-h>がBSと同等の役割を担っている為、キーを再割当
snoremap <C-h> <Nop>

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 行移動を見た目上に移動する
noremap j gj
noremap k gk
