let s:vim_dir = has('win32') ? expand('~/vimfiles') : expand('~/.vim')
execute 'source ' . s:vim_dir . '/common.vimrc'

if has('win32')
    "execute 'source ' . s:vim_dir . '/win.vim'
    execute 'source ' . s:vim_dir . '/plugins.vimrc'
    execute 'source ' . s:vim_dir . '/key.vimrc'
elseif has('unix')
    execute 'source ' . s:vim_dir . '/unix.vimrc'
elseif has('unix')
    execute 'source ' . s:vim_dir . '/mac.vimrc'
endif
