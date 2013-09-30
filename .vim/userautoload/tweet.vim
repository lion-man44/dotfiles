" フレームにアイコン表示
let g:tweetvim_display_icon = 1
" 1ページのtweet数
let g:tweetvim_tweet_per_page = 70

nnoremap <silent><Leader>tw :<C-u>tabnew <Bar> TweetVimHomeTimeline<CR>
nnoremap <silent><Leader>tl :<C-u>TweetVimHomeTimeline<CR>
nnoremap <silent><Leader>tm :<C-u>TweetVimMentions<CR>
nnoremap <Leader>ts :<C-u>TweetVimSay<CR>

augroup TweetVimSetting
  autocmd!
  " マッピング
  " 挿入・通常モードでsayバッファを閉じる
  autocmd FileType tweetvim_say nnoremap <buffer><silent><C-g> :<C-u>q!<CR>
  autocmd FileType tweetvim_say inoremap <buffer><silent><C-g> <C-o>:<C-u>q!<CR><Esc>
  " 各種アクション
  autocmd FileType tweetvim nnoremap <buffer>s :<C-u>TweetVimSay<CR>
  autocmd FileType tweetvim nnoremap <buffer>m :<C-u>TweetVimMentions<CR>
  autocmd FileType tweetvim nmap     <buffer>c <Plug>(tweetvim_action_in_reply_to)
  autocmd FileType tweetvim nnoremap <buffer>t :<C-u>Unite tweetvim -no-start-insert -quick-match<CR>
  autocmd FileType tweetvim nmap <buffer><Leader>F <Plug>(tweetvim_action_remove_favorite)
  autocmd FileType tweetvim nmap <buffer><Leader>d <Plug>(tweetvim_action_remove_status)
  " リロード
  autocmd FileType tweetvim nmap <buffer><Tab> <Plug>(tweetvim_action_reload)
  " ページの先頭に戻った時にリロード
  autocmd FileType tweetvim nmap <buffer><silent>gg gg<Plug>(tweetvim_action_reload)
  " ページ移動をff/bbからf/b に
  autocmd FileType tweetvim nmap <buffer>f <Plug>(tweetvim_action_page_next)
  autocmd FileType tweetvim nmap <buffer>b <Plug>(tweetvim_action_page_previous)
  " favstar や web UI で表示
  autocmd FileType tweetvim nnoremap <buffer><Leader><Leader> :<C-u>call <SID>tweetvim_favstar()<CR>
  " ブラウザで対象のホームを開く
  autocmd FileType tweetvim nnoremap <buffer><Leader>u :<C-u>call <SID>tweetvim_open_home()<CR>
  " 縦移動（カーソルを常に中央にする)
  autocmd FileType tweetvim nnoremap <buffer><silent>j :<C-u>call <SID>tweetvim_vertical_move("gj")<CR>zz
  autocmd FileType tweetvim nnoremap <buffer><silent>k :<C-u>call <SID>tweetvim_vertical_move("gk")<CR>zz
  " 不要マップ消去
  autocmd FileType tweetvim nunmap <buffer>ff
  autocmd FileType tweetvim nunmap <buffer>bb
  " tweetvim バッファに移動した時に自動リロード
  autocmd BufEnter * call <SID>tweetvim_reload()
augroup END

" セパレータを飛ばして移動する
" ページの先頭や末尾でそれ以上 上/下 に移動しようとしたらページ移動する
function! s:tweetvim_vertical_move(cmd)
  execute "normal! ".a:cmd
  let end = line('$')
  while getline('.') =~# '^[-~]\+$' && line('.') != end
    execute "normal! ".a:cmd
  endwhile
  " 一番下まで来たら次のページに進む
  let line = line('.')
  if line == end
    call feedkeys("\<Plug>(tweetvim_action_page_next)")
  elseif line == 1
    call feedkeys("\<Plug>(tweetvim_action_page_previous)")
  endif
endfunction

" filetype が tweetvim ならtweetをリロード
function! s:tweetvim_reload()
  if &filetype ==# "tweetvim"
    call feedkeys("\<Plug>(tweetvim_action_reload)")
  endif
endfunction

" カーソル行のtweetをしたユーザの favstar を開く
function! s:open_favstar()
  let username = expand('<cword>')
  if empty(username)
    OpenBrowser http://ja.favstar.fm/me
  else
    execute "OpenBrowser http://js.favstart.fm/users/" . username
  endif
endfunction
command! Favstar call <SID>open_favstar()

" tweetしたユーザのホームを開く
function! s:tweetvim_open_home()
  let username = expand('<cword>')
  if username =~# '^[a-zA-Z0-9_]\+$'
    execute "OpenBrowser https://twitter.com/" . username
  endif
endfunction

" advanced filter を使う
" https://github.com/rhysd/tweetvim-advanced-filter
let g:tweetvim_filters = ['advanced']
" 外部ファイルのフィルター設定を読み込む
if filereadable($HOME.'/.tweetvimrc')
  . $HOME.tweetvimrc
endif

