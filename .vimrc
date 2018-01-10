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

" ==========================================================================
"   plugins
" ==========================================================================
" plugins下のディレクトリをruntimepathへ追加する。(by kaoriya)
if !has('g:kaoriya_runtimepath_added')
  for s:path in split(glob($VIM.'/plugins/*'), '\n')
    if s:path !~# '\~$' && isdirectory(s:path)
      let &runtimepath = &runtimepath.','.s:path
    endif
  endfor
  unlet s:path
endif
"------------------------------
" plugin management by dein.vim
" set variables
let s:vim_dir = has('win32') ? expand('~/vimfiles') : expand('~/.vim')
let s:dein_dir = s:vim_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let &runtimepath = s:dein_repo_dir.','.&runtimepath
" start dein
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " add plugins
  call dein#add(s:dein_repo_dir)
  " dark powered neo-completion
  call dein#add('Shougo/deoplete.nvim')
  " unite all interfaces
  call dein#add('Shougo/denite.nvim')
  " requirements for nvim plugins
  if !has('nvim')
    call dein#add('roxma/vim-hug-neovim-rpc')
    call dein#add('roxma/nvim-yarp')
  endif
  " latex env
  call dein#add('lervag/vimtex')
  " call system to run program from vim
  call dein#add('thinca/vim-quickrun')
  " linter
  call dein#add('w0rp/ale')
  " preview markdown
  call dein#add('kannokanno/previm')
  " color scheme
  call dein#add('jacoborus/tender.vim')
  call dein#add('cocopon/iceberg.vim')
  " nice statusline
  call dein#add('vim-airline/vim-airline')

  call dein#end()
  call dein#save_state()
endif

" automatically install plugins which are not installed yet
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

"--------------------------------------------
" LaTeX Environment
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

" I just copied and pasted the following:
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" ----------------------------------------------
"  not by dein
" add plugins dir to runtimepath
for s:path in split(glob($HOME.'/vimfiles/plugins/*'), '\n')
    if s:path !~# '\~$' && isdirectory(s:path)
        let &runtimepath = &runtimepath.','.s:path
    endif
endfor
unlet s:path

" QFixHowm
" key leader
let QFixHowm_Key = 'g'
" howm directory
let howm_dir             = $HOME.'/vimfiles/plugins/qfixhowm/memo'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'dos'
" markdown
let QFixHowm_HowmMode = 0
let suffix = 'mkd'
let QFixHowm_UserFileType = 'markdown'
let QFixHowm_UserFileExt = suffix
let QFixHowm_Title = '#'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S'

"-------------------------------------
" previm
let g:previm_open_cmd = "chrome"

" ================================================
" Key mapping and command definition
" ================================================
" exit insert mode with jj
inoremap <silent> jj <ESC>
" edit vimrc with <Space>.
nnoremap <Space>. <C-w>n:edit $MYVIMRC<CR>
" edit gvimrc with <Space>,
nnoremap <Space>, <C-w>n:edit $MYGVIMRC<CR>
" competitive programming
command! Sports :call Sports()
function! Sports()
	if isdirectory($HOME.'/sports')
		:cd ~/sports 
		:e a.cpp
		:%d
		:0r ~/vimfiles/templates/sports.cpp
	else
		:echo '"'.$HOME.'/sports"does not exist.'
	endif
endfunction

