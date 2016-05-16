let plugins = dein#load_cache_raw(['/Users/masarutanaka/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_base_path = '/Users/masarutanaka/.cache/dein'
let g:dein#_runtime_path = '/Users/masarutanaka/.cache/dein/.dein'
let &runtimepath = '/Users/masarutanaka/.cache/dein/repos/github.com/Shougo/vimproc.vim,/Users/masarutanaka/.cache/dein/.dein,/Users/masarutanaka/.cache/dein/repos/github.com/Shougo/dein.vim/,/Users/masarutanaka/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim74,/usr/local/share/vim/vimfiles/after,/Users/masarutanaka/.vim/after,/Users/masarutanaka/.cache/dein/.dein/after'
filetype off
  let g:neocomplete#enable_at_startup = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  
  if !exists('g:neocomplete#sources#dictionary#dictionaries')
    let g:neocomplete#sources#dictionary#dictionaries = {}
  endif
  let dict = g:neocomplete#sources#dictionary#dictionaries
  
  let g:neocomplete#sources#buffer#disabled_pattern = '\.log\|\.log\.\|\.jax\|Log.txt'
  let g:neocomplete#enable_ignore_case = 0
  let g:neocomplete#enable_smart_case  = 1
  let g:neocomplete#enable_fuzzy_completion = 0
  
  call neocomplete#custom_source('_', 'sorters',  ['sorter_length'])
  call neocomplete#custom_source('_', 'matchers', ['matcher_head'])
  
  inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
  inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"
  inoremap <expr><C-e>  pumvisible() ? neocomplete#close_popup() : "<End>"
  inoremap <expr><C-c>  neocomplete#cancel_popup()
  inoremap <expr><C-u>  neocomplete#undo_completion()
  inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
