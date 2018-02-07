" ================================================
" Key mapping and command definition
" ================================================
"" exit insert mode with jj (comment out)
"inoremap <silent> jj <ESC>
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
        :exec ':16'
	else
		:echo '"'.$HOME.'/sports"does not exist.'
	endif
endfunction
