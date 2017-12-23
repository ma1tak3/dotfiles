filetype plugin indent on
syntax enable

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

" ========================================================================= 
" Key mapping
" ========================================================================= 
" exit insert mode with jj
inoremap <silent> jj <ESC>

" edit vimrc with <Space>.
nnoremap <Space>. <C-w>n:edit $MYVIMRC<CR>

colorscheme industry
