" ==========================================================================
" 	plugins
" ==========================================================================
" use vim setting
set nocompatible

" dein.vimによる管理
let s:vim_dir = has('win32') ? expand('~/vimfiles') : expand('~/.vim')
let s:dein_dir = s:vim_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir.','.&runtimepath

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add(s:dein_repo_dir)
  " latex env
  call dein#add('lervag/vimtex')
  " call system to run program from vim
  call dein#add('thinca/vim-quickrun')
  " linter
  call dein#add('w0rp/ale')
  " color scheme
  call dein#add('jacoborus/tender.vim')

  call dein#end()
  call dein#save_state()
endif

" automatically install plugins not installed yet
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

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

" copy and paste
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

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

