"if !exists('g:deoplete#omni_patterns')
"    let g:deoplete#omni_patterns = {}
"endif
"let g:deoplete#omni_patterns.r = '[[:alnum:].\\]\+'
let g:deoplete#omni_input_patterns = {}
let g:deoplete#omni_input_patterns.r =
        \ '\w\+\|[^. \t]->\w*\|\w\+::\w*'
"n-vim
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
set infercase
set hlsearch
set incsearch
"let R_in_buffer = 0
"let R_vsplit = 1
let R_nvimpager = "horizontal"
let R_assign = 0
let R_objbr_place = "console,right"
let R_objbr_opendf = 0
