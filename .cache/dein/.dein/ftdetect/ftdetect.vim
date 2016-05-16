" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx,tmp,old} set filetype=markdown

if exists("disable_r_ftplugin")
  finish
endif

autocmd BufNewFile,BufRead *.Rprofile set ft=r
autocmd BufRead *.Rhistory set ft=r
autocmd BufNewFile,BufRead *.r set ft=r
autocmd BufNewFile,BufRead *.R set ft=r
autocmd BufNewFile,BufRead *.s set ft=r
autocmd BufNewFile,BufRead *.S set ft=r

autocmd BufNewFile,BufRead *.Rout set ft=rout
autocmd BufNewFile,BufRead *.Rout.save set ft=rout
autocmd BufNewFile,BufRead *.Rout.fail set ft=rout

autocmd BufNewFile,BufRead *.Rrst set ft=rrst
autocmd BufNewFile,BufRead *.rrst set ft=rrst

autocmd BufNewFile,BufRead *.Rmd set ft=rmd
autocmd BufNewFile,BufRead *.rmd set ft=rmd
autocmd BufNewFile,BufRead *.toml set filetype=toml

" Rust uses Cargo.toml and Cargo.lock (both are toml files).
autocmd BufNewFile,BufRead Cargo.lock set filetype=toml

if exists("disable_r_ftplugin")
  finish
endif

autocmd BufNewFile,BufRead *.Rprofile set ft=r
autocmd BufRead *.Rhistory set ft=r
autocmd BufNewFile,BufRead *.r set ft=r
autocmd BufNewFile,BufRead *.R set ft=r
autocmd BufNewFile,BufRead *.s set ft=r
autocmd BufNewFile,BufRead *.S set ft=r

autocmd BufNewFile,BufRead *.Rout set ft=rout
autocmd BufNewFile,BufRead *.Rout.save set ft=rout
autocmd BufNewFile,BufRead *.Rout.fail set ft=rout

autocmd BufNewFile,BufRead *.Rrst set ft=rrst
autocmd BufNewFile,BufRead *.rrst set ft=rrst

autocmd BufNewFile,BufRead *.Rmd set ft=rmd
autocmd BufNewFile,BufRead *.rmd set ft=rmd
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
