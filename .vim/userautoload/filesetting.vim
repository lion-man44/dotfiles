if has("autocmd")
  " 改行時にコメントしない
  " 改行時に勝手にインデントしない
  autocmd FileType * setlocal formatoptions-=ro noautoindent nosmartindent

  " ファイル種別による個別設定(初期設定ではexpandtabなのでその設定はいれない)
  " ts = tabstop, sts = softtabstop, sw = shiftwidth, tw = textwidth
  " ft = filetype
  autocmd FileType html,xhtml,css,javascript,yaml,ruby,coffee setlocal ts=2 sts=2 sw=2
  autocmd FileType python     setlocal ts=4 sts=4 sw=4

  " ファイルを開いた時、読み込んだ時にファイルタイプを設定する
  autocmd BufNewFile,BufRead *.js setlocal ft=javascript
  autocmd BufNewFile,BufRead *.ejs setlocal ft=html
  autocmd BufNewFile,BufRead *.py setlocal ft=python
  autocmd BufNewFile,BufRead *.rb setlocal ft=ruby
  autocmd BufNewFile,BufRead Gemfile setlocal ft=ruby
  autocmd BufNewFile,BufRead *.coffee setlocal ft=coffee
  autocmd BufNewFile,BufRead *.ts setlocal ft=typescript
  autocmd BufNewFile,BufRead *.md setlocal ft=markdown
  autocmd BufNewFile,BufRead *.jade setlocal ft=markdown
  autocmd BufNewFile,BufRead *.gyp setlocal ft=json
  autocmd BufNewFile,BufRead *.cson setlocal ft=json
  autocmd BufNewFile,BufRead *.yml setlocal ft=yaml
  autocmd BufNewFile,BufRead *.yaml setlocal ft=yaml

  " ctagsファイルの設定ファイル
  autocmd BufNewFile,BufRead *.rb set tags+=;$HOME/.ruby.ctags;
  autocmd BufNewFile,BufRead *.js set tags+=;$HOME/.javascript.ctags;

endif
