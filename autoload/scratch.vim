"if exists('g:auto_loaded_scratch')
"  finish
"endif
"let g:auto_loaded_scratch = 1
let s:plugindir = expand('<sfile>:p:h:h')

function! scratch#make_new()
  let xt = expand('%:e')
  let tmp = expand(s:plugindir . '/templates/skeleton.' . xt)
  if filereadable(tmp)
    let head = []
    for line in readfile(tmp)
      let line = substitute(line, '{{ fname }}', expand('%:t'), 'g')
      let line = substitute(line, '{{ now }}', strftime("%c"), 'g')
      if !exists('g:scratch_author')
        let g:scratch_author = "author"
      endif
      if !exists('g:scratch_description')
        let g:scratch_description = "Happy vimming"
      endif
      let line = substitute(line, '{{ author }}', g:scratch_author, 'g')
      call add(head, line)

    endfor
    call append(0, '"vim: sw=2 ts=2 et')
    call append(0, head)
    return 1
  endif
  return
endfunction
