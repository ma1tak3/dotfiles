" ==========================================================================
" 	plugins
" ==========================================================================
" use vim setting
set nocompatible

" qfixhown
if has('win32')
	set runtimepath+=$home/vimfiles/qfixapp
endif
" キーマップリーダー
let QFixHowm_Key = 'g'
" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '$home/vimfiles/qfixapp/home_dir'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'cp932'
let howm_fileformat      = 'dos'
" textwidthの再設定
au Filetype qfix_memo setlocal textwidth=0
" 休日定義ファイル
let QFixHowm_HolidayFile = '$home/vimfiles/qfixapp/Sche-Hd-0000-00-00-000000.txt'

" dein.vimによる管理
let s:vim_dir = has('win32') ? expand('~/vimfiles') : expand('~/.vim')
let s:dein_dir = s:vim_dir . '/bundles'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir.','.&runtimepath

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add(s:dein_repo_dir)
  call dein#add('lervag/vimtex')
  call dein#add('thinca/vim-quickrun')
  " color scheme
  call dein#add('jacoborus/tender.vim')

  if version>=800 || has('nvim')
    call dein#add('w0rp/ale')
  endif

  call dein#end()
  call dein#save_state()
endif

" automatically install plugins not installed yet
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

"" neocomplete用の変数　なんかうまく動かんが
"if !exists('g:neocomplete#sources#omni#input_patterns')
"	let g:neocomplete#sources#omni#input_patterns={}
"endif
"let g:neocomplete#sources#omni#input_patterns.tex=
"			\ g:vimtex#re#neocomplete
" let g:python3_host_prog='C:\vim\python\python.exe'
" let g:deoplete#enable_at_startup=1

" ==========================================================================
" LaTeX Environment
" =========================================================================
" make a dvi file first, then generate a pdf file
let g:vimtex_compiler_latexmk = {
            \ 'background' : 0,
            \ 'build_dir' : '',
            \ 'continuous' : 1,
            \ 'options' : [
            \   '-pdfdvi',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
	    \}
let g:vimtex_complete_enabled=1

" automatically read template when you start editing new .tex document
autocmd BufNewFile *.tex 0r ~/vimfiles/templates/latex_template.tex

" set SumatraPDF as a previewer
if has('win32')
	let g:vimtex_view_general_viewer = 'SumatraPDF'
endif

" ========================================================================= 
" An example for a vimrc file.
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2016 Mar 25
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"           for OpenVMS:  sys$login:.vimrc
" ========================================================================= 

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit

" ========================================================================= 
" various settings
" ========================================================================= 
set hidden
set number

" do not creat backup files
set nobackup


set viminfo=
set noundofile

" use UTF-8
set encoding=utf-8

" keep 50 lines of command line history
set history=50

" display incomplete commands
set showcmd           

" do incremental searching
set incsearch

" use mouse
set mouse=a

" show the cursor position all the time
set ruler

" hilight words you are searching
set hlsearch

" move cursor automatically to where it were when you start editing new line
set autoindent

" home directory
cd $home

" ========================================================================= 
" Key mapping
" ========================================================================= 
" exit insert mode with jj
inoremap <silent> jj <ESC>

" edit vimrc with <Space>.
nnoremap <Space>. <C-w>n:edit $MYVIMRC<CR>
" edit gvimrc with <Space>,
nnoremap <Space>, <C-w>n:edit $MYGVIMRC<CR>

" =========================================================================
" New commands
" =========================================================================
" competitive programming
command! Sports :call Sports()

function Sports()
	:cd $home/sports 
	:e a.cpp
	:%d
	:0r ~/vimfiles/templates/sports.cpp
endfunction

