" ==========================================================================
"   plugins
" ==========================================================================
""------------------------------
"" plugin management by dein.vim
"" set variables
"let s:vim_dir = has('win32') ? expand('~/vimfiles') : expand('~/.vim')
"let s:dein_dir = s:vim_dir . '/dein'
"let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
"let &runtimepath = s:dein_repo_dir.','.&runtimepath
"" start dein
"if dein#load_state(s:dein_dir)
"  call dein#begin(s:dein_dir)
"
"  " add plugins
"  call dein#add(s:dein_repo_dir)
"  " dark powered neo-completion
"  call dein#add('Shougo/deoplete.nvim')
"  " unite all interfaces
"  call dein#add('Shougo/denite.nvim')
"  " requirements for nvim plugins
"  if !has('nvim')
"    call dein#add('roxma/vim-hug-neovim-rpc')
"    call dein#add('roxma/nvim-yarp')
"  endif
"  "" latex env
"  "call dein#add('lervag/vimtex')
"  " call system to run program from vim
"  call dein#add('thinca/vim-quickrun')
"  " linter
"  call dein#add('w0rp/ale')
"  " preview markdown
"  call dein#add('kannokanno/previm')
"  " color scheme
"  call dein#add('jacoborus/tender.vim')
"  call dein#add('cocopon/iceberg.vim')
"  " nice statusline
"  call dein#add('vim-airline/vim-airline')
"
"  call dein#end()
"  call dein#save_state()
"endif
"
"" automatically install plugins which are not installed yet
"if has('vim_starting') && dein#check_install()
"  call dein#install()
"endif
"
"filetype plugin indent on
"syntax enable
"
""--------------------------------------------
"" LaTeX Environment
"" make a dvi file first, then generate a pdf file
"let g:vimtex_compiler_latexmk = {
"            \ 'background' : 0,
"            \ 'build_dir' : '',
"            \ 'continuous' : 1,
"            \ 'options' : [
"            \   '-pdfdvi',
"            \   '-verbose',
"            \   '-file-line-error',
"            \   '-synctex=1',
"            \   '-interaction=nonstopmode',
"            \ ],
"	    \}
"let g:vimtex_complete_enabled=1
"
"" automatically read template when you start editing new .tex document
"autocmd BufNewFile *.tex 0r ~/vimfiles/templates/latex_template.tex
"
"" set SumatraPDF as a previewer
"if has('win32')
"	let g:vimtex_view_general_viewer = 'SumatraPDF'
"endif


" ----------------------------------------------
"  not by dein

" plugins下のディレクトリをruntimepathへ追加する。(by kaoriya)
if !has('g:kaoriya_runtimepath_added')
  for s:path in split(glob($VIM.'/plugins/*'), '\n')
    if s:path !~# '\~$' && isdirectory(s:path)
      let &runtimepath = &runtimepath.','.s:path
    endif
  endfor
  unlet s:path
endif

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

" previm
let g:previm_open_cmd = "chrome"

filetype plugin indent on
syntax enable
