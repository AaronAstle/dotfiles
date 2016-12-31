" Whitespace & highlighting & language-specific config
" ----------------------------------------------------

" Strip trailing whitespace for code files on save
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

" C family
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp call StripTrailingWhitespace()

" Ruby, Rails
autocmd BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.scss,*.html,*.xml,*.erb,*.haml,*.feature call StripTrailingWhitespace()

" Java, PHP
autocmd BufWritePre *.java,*.php call StripTrailingWhitespace()

" Highlight Ruby files
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.god set filetype=ruby
au BufRead,BufNewFile Gemfile* set filetype=ruby
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile soloistrc set filetype=ruby

" Highlight JSON files as javascript
autocmd BufRead,BufNewFile *.json set filetype=javascript

" Highlight Jasmine fixture files as HTML
autocmd BufRead,BufNewFile *.jasmine_fixture set filetype=html

" Insert ' => '
autocmd FileType ruby imap  <Space>=><Space>

" Open all folds in Markdown.
autocmd FileType mkd normal zR
" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=mkd "markdown

" Options to Explore with AutoCMD and VIm
"autocmd BufRead,BufNewFile *.html set filetype=html
"autocmd BufRead,BufNewFile *.hamlc set filetype=haml
"autocmd BufRead,BufNewFile *.sass set filetype=css
"autocmd BufRead,BufNewFile *.css set filetype=css
"autocmd BufRead,BufNewFile *.js set filetype=js
"autocmd BufRead,BufNewFile *.scss set filetype=scss.css
"autocmd FileType scss set iskeyword+=


" Automatically comb your CSS on save
"autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb
"

