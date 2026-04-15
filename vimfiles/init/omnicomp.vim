
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
autocmd Filetype ruby setlocal omnifunc=rubycomplete#Complete

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \ if &omnifunc == "" |
    \   setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif
