" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx,tmp,old} set filetype=markdown
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
autocmd BufNewFile,BufRead *.toml set filetype=toml

" Rust uses Cargo.toml and Cargo.lock (both are toml files).
autocmd BufNewFile,BufRead Cargo.lock set filetype=toml
