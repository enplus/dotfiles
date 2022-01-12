" autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

let g:term_buf = 0
let g:term_win = 0

" ================ Buffer Settings ========================
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" \   'source':  reverse(<sid>buflist()),

nnoremap <silent> <leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
" ================ Buffer Settings ========================

" ================ Term_Remove Buffer ========================
function! s:getBufLst()
	redir =>buflist
	silent! ls
	redir END
	return buflist
endfunction

function! s:RemoveEmptyBuffer()
    for bufnum in map(filter(split(s:getBufLst(), '\n'), 'v:val =~ "No Name"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
			if bufwinnr(bufnum) == -1 | silent! exec "bdelete" . bufnum | endif
		endfor
endfunction

" function! s:RemoveQfList()
"     for bufnum in map(filter(split(s:getBufLst(), '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
"       if bufwinnr(bufnum) != -1 | cclose | return | endif
" 		endfor
" endfunction

" function! Term_toggle(height)
"     " call s:RemoveQfList()
"     let l:tmp_id = win_getid()
"     if win_gotoid(g:term_win)
"       if l:tmp_id == g:term_win
"         hide
"       endif
"     else
"         botright new
"         exec "resize " . a:height
"         try
"             exec "buffer " . g:term_buf
"             call s:RemoveEmptyBuffer()
"         catch
"             call termopen($SHELL, {"detach": 0})
"             let g:term_buf = bufnr("")
"         endtry
"         if &buftype == 'terminal' | :startinsert! | endif
"         let g:term_win = win_getid()
"     endif
" endfunction

" nnoremap <silent> <M-j> :call Term_toggle(14)<CR>
" tnoremap <silent> <M-k> <C-\><C-n>:call Term_toggle(14)<CR>
" ================ Term_Remove Buffer ========================

tnoremap <C-Left> <C-\><C-n>:bp<CR>
tnoremap <C-Right> <C-\><C-n>:bn<CR>


" For terminal TmuxNavigate
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" tnoremap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
" tnoremap <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
" tnoremap <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
" tnoremap <C-l> <C-\><C-n>:TmuxNavigateRight<CR>

" Terminal go back to normal mode
tnoremap jj <C-\><C-n>
