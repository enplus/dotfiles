" tern
let mapleader = "\<Space>"

" map Function(1~12) Key & Some  :"{{{
  nnoremap  <F1> :exec("help ".expand("<cword>"))<CR><C-W>_
  inoremap  <F1> <Esc>:exec("help ".expand("<cword>"))<CR><C-W>_

  map  <F2> :NERDTreeToggle<CR>
" nnoremap <silent> <F3> :ALEGoToDefinition<CR>
  nmap <F4> :TagbarToggle<CR>
"	map  <F4> zN
	nnoremap <F8> :GundoToggle<CR>

"	map  <S-F9> :!echo 'Compile - g++ % -o %<.out ' && echo && g++ % -o %<.out && ./%<.out <CR>

  map  <F9> `av`b:SlimuxREPLSendSelection<CR><CR><C-J><CR><C-K>
  map  <F10> :set textwidth=119<CR>:set colorcolumn=120<CR>:highlight colorcolumn ctermbg=237<CR>:syntax keyword pythonBuiltinFunc debuginfo pprint<CR>
  map  <F11> ^]
  nnoremap <silent> <F12> :call ToggleColorscheme()<CR>
"	:let &background = ( &background == "dark"? "light" : "dark" )<CR> :hi SyntasticError cterm=bold ctermbg=167<CR>
	" :hi SyntasticErrorLine cterm=underline<CR>

function! ToggleColorscheme()
	if (g:colors_name == "gruvbox")
		set bg=light
		colors solarized
	else
		set bg=dark
		colors gruvbox
	endif

  if &filetype == 'haskell'
    call Haskell_gruvbox()
  endif
endfunction

	nnoremap <C-x><C-x> <C-x>
	nnoremap <silent> <C-x><C-c> :cclose<CR> :q<CR>

if has('win32')
  nnoremap <C-/> :Commentary<CR>
  vnoremap <C-/> :Commentary<CR>
else
  "ctrl + /(slash:c+v,c+_)
  nnoremap <C-_> :Commentary<CR>
  vnoremap <C-_> :Commentary<CR>
endif

	"tags vertical split
	"nmiap <C-]> :exec "vertical ptag " . expand("<cword>")<CR>:exec "vertical resize " . (winheight(0) * 6/10)<CR>

	" function! FollowTag()
	" 	if !exists("w:tagbrowse")
	" 		vsplit
	" 		let w:tagbrowse=1
	" 	endif
	" 	execute "tag " . expand("<cword>")
	" endfunction

	" nnoremap <c-]> :call FollowTag()<CR>
	" nnoremap <C-]> :only<bar>split<CR>:execute "tag" . expand('<cword>')<CR>

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" nnoremap <silent> <c-w><left>  :exec "vertical resize " . (winheight(0) * 3/2)<CR>
	"map <C-]> :sp <CR>:exec("tag ".expand("<cword>"))<CR><C-W>k<C-W>_

  "Ctags
	" nmap <C-S-]> <C-w>20g<C-]><C-w>_
	" nmap <C-[> :tprev<CR>
	" nnoremap <leader>tn :tnext<CR>
	" nnoremap <leader>tp :tprev<CR>

	"nnoremap <leader><leader> za
  " nnoremap <silent> <S-E> ge

	" Resize window
  nnoremap <leader>= <C-w>2+
	nnoremap <leader>- <C-w>2-
	nnoremap <leader>, <C-w>5<
	nnoremap <leader>. <C-w>5>

	" Split Widow
	nnoremap <C-w>p :vsplit<CR>
	nnoremap <C-w>o :split<CR>

	" Leave Ex mode
	nnoremap Q <nop>

	" map  <C-e> :call ToggleNERDTreeAndTagbar() <CR>
" }}}

	" Ctrl+S - ScrollLock 대신 Save로
	nmap <c-s> <Esc>
	imap <c-s> <Esc>
	imap <c-s> <Esc>

" For BufferList"{{{
" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다. SetHidden? 설명 확인
set hidden

" Copy & Paste Like Windows
  vmap <C-Insert> "+y
  vmap <S-Delete> "+c
  vmap <S-Insert> c<ESC>"+p
"	imap <C-v> <C-r><C-o>+

"  map Function
"FoldingBracket map  [{v]}zf"}}}
	"" ESC키를 누르면 한글 모드가 해제 "
	" 입력모드에서 이전 언어 설정 모드 유지 "
" inoremap <ESC> <ESC> :set imdisable<CR>
" nnoremap i :set noimd<CR>i
" nnoremap I :set noimd<CR>I
" nnoremap a :set noimd<CR>a
" nnoremap A :set noimd<CR>A
" nnoremap o :set noimd<CR>o
" nnoremap O :set noimd<CR>O

" nnoremap <leader>c :set cursorline! cursorcolumn!<CR>
" nnoremap <leader>C :set cursorline cursorcolumn<CR>

" Plugin key-mappings.
inoremap <expr><C-g>     deoplete#undo_completion()
inoremap <expr><C-l>     deoplete#complete_common_string()

" Tab navigation like Firefox.
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :cabnext<CR>
" nnoremap <C-t>     :tabnew<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>

" for terminal
if has('win32')
	noremap <M-left> :bn<CR>
	noremap <M-right> :bp<CR>
	nnoremap <silent> <C-`> :10sp<CR>:terminal<CR>
  " gen terminal
	" nnoremap <silent> <C-M-`> :10sp<CR>:terminal<CR>
  " open terminal buffer
endif

nnoremap <silent> <C-Left> :bp<CR>
nnoremap <silent> <C-Right> :bn<CR>

" nnoremap <silent> <A-Left> :tabprevious<CR>
" nnoremap <silent> <A-Right> :tabnext<CR>

" nnoremap <silent> <A-Left> :bp<CR>
" nnoremap <silent> <A-Right> :bn<CR>

nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>bq :bp <BAR> bd #<CR>

" for TmuxNavigater Don't allow any default key-mappings.

" Re-enable tmux_navigator.vim default bindings, minus <c-\>.
" <c-\> conflicts with NERDTree "current file".

let g:tmux_navigator_no_mappings = 1
nmap <silent><C-h> :TmuxNavigateLeft<cr>
nmap <silent><C-j> :TmuxNavigateDown<cr>
nmap <silent><C-k> :TmuxNavigateUp<cr>
nmap <silent><C-l> :TmuxNavigateRight<cr>

"nnoremap <C-> :echo "wow"<CR>
"resize
" nnoremap <silent> <c-w><up>    :exec "resize " . (winheight(0) * 2/3)<CR>
" nnoremap <silent> <c-w><down>  :exec "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <c-w><left>  :exec "vertical resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <c-w><right> :exec "vertical resize " . (winheight(0) * 2/3)<CR>
"
" Mappings to easily toggle fold levels "{{{
nnoremap <silent> z0 :set foldlevel=0<cr>
nnoremap <silent> z1 :set foldlevel=1<cr>
nnoremap <silent> z2 :set foldlevel=2<cr>
nnoremap <silent> z3 :set foldlevel=3<cr>
nnoremap <silent> z4 :set foldlevel=4<cr>
nnoremap <silent> z5 :set foldlevel=5<cr>
nnoremap <silent> z6 :set foldlevel=6<cr>
nnoremap <silent> z7 :set foldlevel=7<cr>
nnoremap <silent> z8 :set foldlevel=8<cr>
nnoremap <silent> z9 :set foldlevel=9<cr>
"}}}

nnoremap <silent> <C-p> :FZF<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >>>>>>>>\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" for vim-multiple_cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" nmap <silent> <leader>b <Plug>(ale_previous_wrap)
" nmap <silent> <leader>f <Plug>(ale_next_wrap)

" for vim-exchange
" nmap <c-x>x <Plug>(Exchange)iw
" nmap <C-x><CR> <Plug>(ExchangeLine)
vmap <C-x>x X
nmap <C-x>x cxiw
nmap <C-x>( cs[(
nmap <C-x>[ cs([

inoremap jj <Esc>
tnoremap jj <C-\><C-n>

nnoremap k gk
nnoremap gk k

nnoremap j gj
nnoremap gj j

inoremap <Esc> <Esc><Esc>


function! s:ipad_keymap()
  nnoremap L :
  " Override statusline as you like
endfunction

