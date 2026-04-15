" Pick completion type based on context
let g:SuperTabDefaultCompletionType = "context"

" Default completion type is user (aka completefunc)
let g:SuperTabContextDefaultCompletionType = "<c-x><c-u>"

" Always define completefunc based on omnifunc
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("context") |
  \ endif
