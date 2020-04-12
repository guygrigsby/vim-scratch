if exists('g:loaded_scratch')
  finish
endif
let g:loaded_scratch = 1

command! NewFromTemplate :execute scratch#make_new()

autocmd BufNewFile *.vim :NewFromTemplate
