" ========================================================================= 
" settings
" ========================================================================= 
" use UTF-8
set encoding=utf-8
scriptencoding utf-8
" use vim setting
set nocompatible
" just hide buffur when abondoned
set hidden
" -----------------
" about display:
" show number of line in the left of the window
set number
" show one line in one line
set nowrap
" do not display tabs and the end of line
set nolist
" show title (including in task bar)
set title
" display incomplete commands
set showcmd           
" set height of command line (which is in the bottom) 2
set cmdheight=2
" always show status line of the last window
set laststatus=2
" width of tabs
set tabstop=4
" insert spaces as tab
set expandtab
" use 4 spaces for each step of indent
set shiftwidth=4
" delete indent and end of line by pressing backspace
set backspace=indent,eol,start

" keep 50 lines of command line history
set history=50
" do not creat backup files, viminfo files, and undo files.
set nobackup
set viminfo=
set noundofile
"------------------
" about search:
" do incremental searching
set incsearch
" case
set ignorecase
set smartcase
" hilight words you are searching for
set hlsearch
" go back to the top of file after searching the bottom
set wrapscan

" use mouse
set mouse=a
" show the cursor position all the time
set ruler
" move cursor automatically to where it were when you start editing new line
set autoindent
" be home directory when editor is started
cd $home

" I just copied and pasted the following:
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
