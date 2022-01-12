" omnifuncs
augroup omnifuncs
	autocmd!
	autocmd FileType css						setl omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown	setl omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript			setl omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python					setl omnifunc=pythoncomplete#Complete
	autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
	autocmd FileType ruby						setl omnifunc=rubycomplete#Complete
augroup end

"autocmd FileType aa				setl omnifunc=necoghc#omnifunc

" python
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd FileType python setl textwidth=79 expandtab
autocmd FileType python set tags+=./tags_current

autocmd FileType vb,basic       setl expandtab commentstring=\'\ %s

autocmd BufNewFile,BufRead *.pc,*.sc,*.ec set filetype=c
autocmd BufNewFile,BufRead *.ejs,*.jade   set filetype=html
autocmd BufNewFile,BufRead tags.*         set filetype=tags
autocmd BufNewFile,BufRead make.*.config  set filetype=make
autocmd BufNewFile,BufRead make.*.depend  set filetype=make

autocmd FileType cabal       setl expandtab

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType markdown,vim,html,javascript setl ts=2 sts=2 sw=2 expandtab

" 주석 연결기능 삭제
set formatoptions-=r

" Layout Config - OverLenth
augroup vimrc_autocmds
	" 길이 초과(OverLength)시 그레이 표시 - 110자로 현재 세팅
	autocmd Filetype python,pc,sc,c,cpp highlight OverLength ctermbg=darkgrey guibg=#592929
	autocmd BufEnter python,pc,sc,c,cpp match OverLength /\%100v.*/
	" 화면 끝의 불필요한 공백 표시여부 - Gvim에서는 투명으로 변경 guibg=#592929
		" 2016.07.01  Cleatool update 불가로 삭제
		" autocmd BufEnter * highlight UnwantedSpaces ctermbg=none guibg=#592929
		" autocmd BufEnter * match UnwantedSpaces /\s\+$/

	" Use the below highlight group when displaying bad whitespace is desired.
	hi BadWhitespace ctermbg=red guibg=red
	" Display tabs at the beginning of a line in Python mode as bad.
	au FileType python,haskell,cabal match BadWhitespace /^\t\+/
	"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
	" " Make trailing whitespace be flagged as bad.
"	au BufRead,BufNewFile  *.py,*.pyw,*.rb,*.c,*.h,*.pl,*.pm,*.php,*.hs match BadWhitespace /\s\+$/
augroup END

"타이틀 명 - Vim
"au BufEnter * let &titlestring = hostname() . "@" . expand("%:f")
au BufEnter * let &titlestring = strpart( hostname(), 0, match( hostname(), '\.' ) ) . "<" . $USER . "> " . fnamemodify( getcwd(), ':~' ) . " (" . fnamemodify( expand( "%:p" ), ":.") . ")"
set title

" Open Quickfix window automatically after running :make
" http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
" augroup OpenQuickfixWindowAfterMake
" 	autocmd QuickFixCmdPost [^l]* nested cwindow
" 	autocmd QuickFixCmdPost    l* nested lwindow
" augroup END

"저장시 우측 badspace 제거(치환)
autocmd FileType c,cpp,java,php,python,sql,markdown,ocaml,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

"turn on tabs if that's the file format
" 뭐하는건지 모르겠음 파악되면 적용
function! Settabs()
	if len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^\\t"')) > len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^ "'))
	"set noet ts=4 sw=4
	endif
endfunction

autocmd BufReadPost * call Settabs()

au Filetype * setl fo-=ro " // 연결주석처리 막기 - set formatoptions

" for c++"{{{
autocmd FileType c,cs,cpp let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"

"}}}
"

" javascript
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" Tmux Windows names
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

" Quickfix&Loclist Close Direct with :q
au WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif
au WinEnter * if &buftype ==# 'terminal' && winnr('$') == 1 | quit | endif

augroup previewWindowPosition
   au!
   autocmd BufWinEnter * call PreviewWindowPosition()
augroup END
function! PreviewWindowPosition()
   if &previewwindow
      wincmd L
   endif
endfunction
