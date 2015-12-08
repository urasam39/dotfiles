" 行番号の表示
set nu

" 右下に表示される行・列の番号を表示
set ruler

" 自動インデントを有効にする
set autoindent

"C言語スタイルのインデントを自動で入れる
set cindent

" タブを表示する時の幅
set tabstop=4
 
" 自動で挿入されるインデントの幅
set shiftwidth=4
 
" タブ入力時の幅を4に設定
set softtabstop=4
 
" 閉じ括弧入力時に対応する括弧の強調
set showmatch
 
" showmatch設定の表示秒数(0.1秒単位)
set matchtime=4
 
" インクリメンタルサーチを行う(検索文字入力中から検索)
set incsearch
 
" 文字列検索で大文字小文字を区別しない
set ignorecase
 
" 文字列検索でマッチするものをハイライト表示する
set hlsearch
 
" 検索文字に大文字が含まれる場合にignorecaseをOFFにする(大文字小文字を区別する)
set smartcase
 
" コマンドラインにおける補完候補の表示
set wildmenu
 
" Deleteキーを有効にする
set t_kD=^?
 
" バックスペースキーの動作を普通のテキストエディタと同じようにする
set backspace=indent,eol,start
 
" 見た目によるカーソル移動をする(1行が複数行に渡って表示されている時に表示上の行ごとに上下移動させる)
nnoremap j gj
nnoremap k gk
 
" シンタックスを有効にする(コードをカラーを付けて見やすくする)
syntax enable
 
" エンコーディングをutf8に設定
set encoding=utf8

" ファイルエンコードをutf8に設定
set fileencoding=utf-8

" 編集中のファイル名を表示
set title

" ウィンドウの幅より長い行は折り返して表示
set wrap

" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 NeoBundle 'altercation/vim-colors-solarized'
 NeoBundle 'jalvesaq/R-Vim-runtime'
 NeoBundle 'jcfaria/Vim-R-plugin'
 NeoBundle 'Shougo/Unite.vim'
 NeoBundle 'Shougo/neomru.vim'
 NeoBundle 'Shougo/vimfiler.vim'
" NERDTreeを設定                
 NeoBundle 'scrooloose/nerdtree'
"カッコを自動で
 NeoBundle 'Townk/vim-autoclose'
"最強の補完
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

call neobundle#end()
 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
" カラー設定
" colorscheme torte
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set background=dark
colorscheme solarized
call togglebg#map("")

 " VimFiler Settings"{{{
nnoremap <Leader>e :VimFilerExplorer<CR>
" close vimfiler automatically when there are only vimfiler open
autocmd MyAutoCmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
let s:hooks = neobundle#get_hooks("vimfiler")
function! s:hooks.on_source(bundle)
  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_enable_auto_cd = 1
endfunction
unlet s:hooks
" Edit file by tabedit.
let g:vimfiler_edit_action = 'tabopen'
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
"}}}

