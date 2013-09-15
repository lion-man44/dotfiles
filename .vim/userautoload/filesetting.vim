" 改行時にコメントしない
if has("autocmd")
  autocmd FileType * set formatoptions-=ro
  
  " ファイル種別による個別設定(初期設定ではexpandtabなのでその設定はいれない)
  " ts = tabstop, sts = softtabstop, sw = shiftwidth
  autocmd FileType ruby       setlocal ts=2 sts=2 sw=2
  autocmd FileType coffee     setlocal ts=2 sts=2 sw=2
  autocmd FileType html,xhtml,css,javascript setlocal ts=2 sts=2 sw=2
  
  autocmd BufNewFile, BufRead *.coffee  setlocal ft=coffee
  autocmd BufNewFile, BufRead *.js setlocal ts=2 sw=2 sts=2 ft=javascript

  " omni補完設定
  autocmd FileType javascript
    \ :setlocal omnifunc=jscomplete#CompleteJS
endif
