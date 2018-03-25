" vimprocで非同期実行
" 成功時にバッファ、失敗時にQuickFixで表示
" 結果表示のサイズ調整など
let g:quickrun_config = {
    \ '_' : {
    \ 'runner' : 'vimproc',
    \ 'runner/vimproc/updatetime' : 40,
    \   'outputter/buffer/split' : ':rightbelow 18sp',
    \   'outputter/error/success' : 'buffer',
    \   'outputter/error/error'   : 'quickfix',
    \   "outputter/buffer/into" : '1',
    \   'outputter/quickfix/errorformat' : '%f:%l,%m in %f on line %l',
    \   'outputter/buffer/close_on_empty' : 1,
    \   'outputter' : 'error',
    \ }
\}

" 実行時に前回の表示内容をクローズ&保存してから実行
let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
