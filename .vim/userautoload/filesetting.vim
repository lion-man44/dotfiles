if has("autocmd")
  " 改行時にコメントしない
  " 改行時に勝手にインデントしない
  autocmd FileType * setlocal formatoptions-=ro noautoindent nosmartindent
  
  " ファイル種別による個別設定(初期設定ではexpandtabなのでその設定はいれない)
  " ts = tabstop, sts = softtabstop, sw = shiftwidth, tw = textwidth
  " ft = filetype
  autocmd FileType ruby       setlocal ts=2 sts=2 sw=2
  autocmd FileType coffee     setlocal ts=2 sts=2 sw=2
  autocmd FileType html,xhtml,css,javascript setlocal ts=2 sts=2 sw=2
  
  " *.jsファイルを開いた時、読み込んだ時にファイルタイプを設定する
  autocmd BufNewFile,BufRead *.js setlocal ft=javascript

  " *.coffeeファイルを開いた時、読み込んだ時にファイルタイプを設定する
  autocmd BufNewFile,BufRead *.coffee setlocal ft=coffee
  " 書き込み時にコンパイルする
  autocmd BufWritePost *.coffee silent make! -bc
  nnoremap <silent> <C-c> :CoffeeCompile vert <CR><C-w>h

  " omni補完設定
  autocmd FileType javascript
    \ :setlocal omnifunc=jscomplete#CompleteJS
endif
