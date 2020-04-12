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
      let line = substitute(line, '{{ name }}', expand('%:h:t'), 'g')
      call add(head, line)

    endfor
    call append(0, head)
    return 1
  endif
  return

  if !exists('g:scratch_author')
    let g:scratch_author = "Guy J Grigsby <https://grigsby.dev>"
  endif
  if !exists('g:scratch_version')
    let g:scratch_version = "0.1.0"
  endif
  if !exists('g:scratch_description')
    let g:scratch_description = "A plugin, mostly useless, Just like I feel these days."
  endif
  call s:write_vim_header()
endfunction

function! s:write_vim_header()
  let line = '" Version: ' . g:scratch_version
  call append(0, line)
  let line = '" Author: ' . g:scratch_author
  call append(0, line)
  let desc_line = ['"', expand('%:t'), g:scratch_description]
  let line = join(desc_line, ' ')

  call append(0, line)
endfunction


