" mode line
set modeline
set wildmenu
set wildmode=list,longest:full
set showtabline=2
set foldmethod=marker
set laststatus=2
set t_Co=256
set nocompatible

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
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp

" 編集中のファイル名を表示
set title

" ウィンドウの幅より長い行は折り返して表示
set wrap

"バッファをクリップボードにコピー(for OSX)
set clipboard+=unnamedplus
"set clipboard=unnamed,autoselect

" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

"In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"auto cursol move
set whichwrap=b,s,h,l,<,>,[,]


inoremap <C-f> <Esc>

" neosnippet "{{{
" <C-J> にマッピング. スニペット補完
" Plugin key-mappings.
" imap <C-J> <Plug>(neosnippet_expand_or_jump)
"smap <C-J> <Plug>(neosnippet_expand_or_jump)
"xmap <C-J> <Plug>(neosnippet_expand_target)
""" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: "\<TAB>"
"" For snippet_complete marker.
if has('conceal')
  set conceallevel=1 concealcursor=i
endif
" let g:neosnippet#snippets_directory=s:bundle_root
"}}}


" dein.vimのもろもろはここから


" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" プラグインが実際にインストールされているディレクトリ
" OSごとにインストール場所を変更
let OSTYPE = system('uname')
if OSTYPE == "Darwin\n"
	let s:dein_dir = expand('~/.cachenvimMac/dein')
elseif OSTYPE == "Linux\n"
	let s:dein_dir = expand('~/.cachenvimLinux/dein')
elseif OSTYPE == "FreeBSD\n"
	let s:dein_dir = expand('~/.cachenvimFreeBSD/dein')
endif

" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(expand(s:dein_dir))
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy' : 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

"これを書かないと毎回読んでくれないのかな…？
" Required:
filetype plugin indent on

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

"dein.vimのもろもろはここまで


" syntastic"{{{
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✑'
let g:syntastic_style_warning_symbol = '✏︎'
" ✍ ✏︎ ✒︎ ✄ ✂︎ ☕︎ ✑ ☹ ⚡︎ ☞
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['ruby', 'c', 'go', 'php'],
      \ 'passive_filetypes': ['html']
      \}
" let g:syntastic_auto_loc_list=1
noremap \gs :<C-u>SyntasticToggleMode<CR>
noremap \gc :<C-u>SyntasticCheck<CR>
noremap \gl :<C-u>SyntasticSetLoclist<CR>
let g:syntastic_enable_highlighting=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_r_svtools_checker=1
let g:syntastic_enable_r_lint_checker=1
" let g:syntastic_r_lint_styles = 'list(spacing.indentation.notabs, spacing.indentation.evenindent)'
let g:syntastic_r_checkers = ['svtools', 'lint']
let g:syntastic_python_checker = 'flake8'
let g:syntastic_javascript_checker = "jshint"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"}}}

" colorscheme Settings/*{{{*/
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
"/*}}}*/





