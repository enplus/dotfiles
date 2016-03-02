"Settings Color Scheme - /usr/share/vim/colors/
syntax enable

let mapleader = "\<Space>"

set exrc

syntax on
filetype plugin indent on

" Vundle default Settings"{{{
	set nocompatible              " be iMproved, required
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	" Keep Plugin commands between vundle#begin/end.
	" plugin on GitHub repo
	Plugin 'tpope/vim-fugitive'
	" plugin from http://vim-scripts.org/vim/scripts.html
	Plugin 'L9'
	" Git plugin not hosted on GitHub
	"Plugin 'git://git.wincent.com/command-t.git'
	" git repos on your local machine (i.e. when working on your own plugin)
	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	" Avoid a name conflict with L9
	" "}}}

		"Bundle List"{{{
		Bundle 'The-NERD-tree'
		Bundle 'ctrlp.vim'
		Bundle 'taglist.vim'
		Bundle 'vim-airline/vim-airline'
		Bundle 'vim-airline/vim-airline-themes'
		Bundle 'paranoida/vim-airlineish'
		Bundle 'easymotion/vim-easymotion'
		"Bundle 'jistr/vim-nerdtree-tabs'

		"visual - colorscheme,syntax
		Bundle 'BusyBee'
		Bundle 'moria'
"		Bundle 'vividchalk.vim'
"		Bundle 'altercation/vim-colors-solarized'
		Bundle 'scrooloose/syntastic'
		Bundle 'luochen1990/rainbow'
		Bundle 'flazz/vim-colorschemes'

		" Mark 표시
		Bundle 'kshenoy/vim-signature'

		Bundle 'octol/vim-cpp-enhanced-highlight' 

		"python
		Bundle 'Python-Syntax'
		Bundle 'vim-python-virtualenv'
		Bundle 'vim-ipython'
		Bundle 'Python-mode-klen'

	"	Bundle 'SrcExpl'		 "Bundle 'Source-Explorer-srcexpl.vim'
	"	Bundle 'Trinity'		 "Bundle 'trinity.vim'
	"	Bundle 'SuperTab'
	"	Bundle 'snipMate'
	"	Bundle 'xolox/vim-notes'
	"	Bundle 'xolox/vim-misc'

		"WindowsManager
		Bundle 'winmanager'
		Bundle 'christoomey/vim-tmux-navigator'

		"Make,Build,Compile
	"	Bundle 'autocomp.vim'
		Bundle 'OmniCppComplete'
		Bundle 'AutoComplPop'
		Bundle 'SingleCompile'
		Bundle 'Valloric/YouCompleteMe'
		Bundle 'Valloric/ListToggle'

		"For editing
		" 주석 처리 - gcc 현재라인 gci} 블럭 등
		Bundle 'tpope/vim-commentary'				
		" .으로 반복 작업
		Bundle 'tpope/vim-repeat'
		" vim상에서 :Make 명령 제공
		Bundle 'tpope/vim-dispatch'

		" ds( - () 괄호 제거 cs'( '를 (로 변경
		Bundle 'tpope/vim-surround'
		Bundle 'gundo'

		"MarkDown	
		Bundle 'suan/vim-instant-markdown'
"		Plugin 'plasticboy/vim-markdown'
"		Bundle 'tpope/vim-markdown'

		"git
		Bundle 'airblade/vim-gitgutter'
		
		Plugin 'godlygeek/tabular'
		Bundle 'nelstrom/vim-markdown-preview'

		"Plugin 'AutoClose'

		"pathogen install
		"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

		"cd ~/.vim/bundle
		"git clone git://github.com/tpope/vim-dispatch.git
		"git clone git://github.com/tpope/vim-surround.git
		"git clone https://github.com/oblitum/rainbow
		""}}}

"{{{ Vundle#end
call vundle#end()            " required
filetype plugin indent on    " required
"}}}

" Airline Settings"{{{
let g:airline#extensions#tabline#enabled = 1
" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_detect__paste=1
let g:airline_theme='airlineish'
"}}}

" Default Settings: /*{{{*/
	set number					" nu
	set numberwidth=5			" nuw - 줄 넘버 표시 너비 설정(set nuw)
	set autoindent				" ai
	set smartindent				" si
	set cindent					" ci - c style index
	set history=100				" 명령어에 대한 히스토리를 100개까지
	set tabstop=4				" tab을 4칸으로
	set softtabstop=4			" sts - tab >> space no ???
	set shiftwidth=4			" sw - shift를 4칸으로 ( >, >>, <, << 등의 명령어)
	set noexpandtab				" noet - Tab의 
	set	showcmd
	set showmatch				" 매칭되는 괄호를 보여줌
	set wildmenu				" wmnu - 명령어 tab으로 완성시 리스트를 보여준다(help 등)

	set hlsearch				" 검색시 하이라이트(색상 강조)
	set incsearch				" 점진적 검색

	"set fileencodings=ucs-bom,utf-8,euc-kr,cp949  " fencs
	"set fwencs=utf-8,euc-kr,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le,iso-8859-1
	set fileencodings=ucs-bom,utf-8,euc-kr


	set backspace=""			" Vi compatible
	set sol						" 이동시 줄 시작으로 자동 이동
	set nowrapscan				" 검색시 끝에서 처음으로 돌아가지 않음
	set foldmethod=marker		" fdm - manual, indent, expr, marker, syntax, diff
	set foldmarker={{{,}}}		" fmr -
	set nofoldenable			" fold open(default)
"	set colorcolumn=100		" 세로 줄 세팅 - 구분용
	hi ColorColumn ctermbg=darkgray

"	set ruler					" 상태표시줄에서 커서의 위치 표시 -Airline 대체
"	set bs=indent,eol,start		" backspace로 이전줄 편집 가능
"	set ignorecase				" For search - Upper/Lower case ignore
"
	"}}}

" }}}


"au FileType * setl fo-=cro
au BufNewFile,BufRead *.pc,*.sc,*.c set filetype=c
au BufNewFile,BufRead tags.* set filetype=tags
au BufNewFile,BufRead make.*.config setf make
au BufNewFile,BufRead make.*.depend setf make
"au BufEnter * let &titlestring = hostname() . "@" . expand("%:f")
au BufEnter * let &titlestring = strpart( hostname(), 0, match( hostname(), '\.' ) ) . "<" . $USER . "> " . fnamemodify( getcwd(), ':~' ) . " (" . fnamemodify( expand( "%:p" ), ":.") . ")"
set title

"au FileType php setl ofu=phpcomplete#CompletePHP
"au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html set omnifunc=htmlcomplete#CompleteTags
"au FileType c setl ofu=ccomplete#CompleteCpp
"au FileType cpp setl ofu=cppcomplete#CompleteCpp
"au FileType css setl ofu=csscomplete#CompleteCSS
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" 마지막 편집 위치 기억"{{{
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "norm g`\"" |
\ endif"}}}

set laststatus=2 " AirLine 외 기타 설정용
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

"set nowrap
"set listchars=extends:>,precedes:<

set cursorline
"hi Normal ctermbg=NONE		"Black Backgroud (System Color)
"set cursorcolumn

" map Function :"{{{
	"   map <C-l> :TlistAddFiles ~/include/TbdatAll.h ~/include/quote_rq.h<CR>:Tlist<CR><C-w>w
	map <F1> :exec("help ".expand("<cword>"))<CR><C-W>_
	map <F2> :TlistToggle<CR>
	map <F3> :NERDTreeToggle<CR>
"	map <F4> zN
"	nnoremap <F5> :GundoToggle<CR>
	map <F6> ^Ww
	map <F7> O
	map <F8> [i
"	map <S-F9> :!echo 'Compile - g++ % -o %<.out ' && echo && g++ % -o %<.out && ./%<.out <CR>
	nmap <F9> :SingleCompileRun <CR>
	map <F10> ''
	map <F11> ^]
	map <F12> ^T

	nmap <Leader>p :InstantMarkdownPreview<CR>

"	set winminheight=0			" wmh
"	set winminwidth=1			" wmw
	nmap <C-X> :q <CR>
"""""	map <C-h> :Tlist<CR><C-w>w
"""""	map <C-J> <C-w>j<C-w>_
"""""	map <C-K> <C-w>k<C-w>_
	nmap <C-]> <C-w>g<C-]><C-w>_
	"map <C-]> :sp <CR>:exec("tag ".expand("<cword>"))<CR><C-W>k<C-W>_
	"
	"for Buffer
	map <C-t> :enew<CR>
	"set <PageUp>='[5~'
	"map <C-PageUp>:!echo "WTF"<CR>
	"map <C-PageDown> :bn<CR>
	"nmap <C-S-Tab> :bn<CR>
	"
" For BufferList"{{{
" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.
set hidden

" 버퍼 새로 열기
" 원래 이 단축키로 바인딩해 두었던 :tabnew를 대체한다.
nmap <leader>T :enew<CR>

" 다음 버퍼로 이동
nmap <leader><Tab> :bnext<CR>

" 이전 버퍼로 이동
nmap <leader><S-Tab> :bprevious<CR>

" 현재 버퍼를 닫고 이전 버퍼로 이동
" 탭 닫기 단축키를 대체한다.
nmap <leader>bq :bp <BAR> bd #<CR>

" 모든 버퍼와 각 버퍼 상태 출력
nmap <leader>bl :ls<CR>"}}}


	" Copy & Paste Like Windows
"	vmap <C-c> "+y
"	vmap <C-x> "+c
"	vmap <C-v> c<ESC>"+p
"	imap <C-v> <C-r><C-o>+

"  map Function

"FoldingBracket map  [{v]}zf"}}}

" Set tags: {{{
	" 각 폴더별 분류에 따른 tags 세팅
	" 'if문의 =~' 의미는 포함 여부
	set tags=./tags,tags
	set tags+=$TAGS_DIR/tags.BCM			"bcm
	if getcwd() =~ $IMDB_HOME				"imdb
" set tags+=$TAGS_DIR/tags.IMDB,tags
		set tags+=$IMDB_HOME/include/tags
		set tags+=$IMDB_HOME/src/tags
	elseif getcwd() =~ $BOS_HOME			"bos
		set tags+=$TAGS_DIR/tags.BOS
	elseif getcwd() =~ $INFOWAY_HOME		"infoway
		set tags+=$TAGS_DIR/tags.INFOWAY
	elseif getcwd() =~ $MFP_HOME			"mfp
		set tags+=$TAGS_DIR/tags.MFP
	elseif getcwd() =~ $WQIS_HOME			"wqis
		set tags+=$TAGS_DIR/tags.WQIS
	elseif getcwd() =~ $ORD_HOME			"ord
		set tags+=$ORD_HOME/include/tags
		set tags+=$ORD_HOME/src/tags
"		set tags+=$ORD_HOME/lib/tags
	elseif getcwd() =~ $GFX_HOME			"gfx
		set tags+=$GFX_HOME/src/tags
	elseif getcwd() =~ $ALICE_HOME			"alice
		set tags+=$ALICE_HOME/src/tags.ALICE
	endif

	"if getcwd() =~ "/home/cc_stg/"
	"	set enc=euc-kr
	"	"set fenc=euc-kr
	"else
	"	set enc=utf-8
	"	"set fenc=utf-8
	"endif
"set complete
"set tagbsearch
" }}}

" Set taglist:/*{{{*/
	let g:Tlist_Display_Tag_Scope =0
	let g:Tlist_Display_Prototype =0
	let g:Tlist_Sort_Type = "type"    "order, name
	"let g:Tlist_Use_Right_Window = 0
	let g:Tlist_WinWidth = 25 
	let g:Tlist_Close_On_Select  = 1
	let g:Tlist_Auto_Open=0
	let g:Tlist_Use_Split_Window = 1
"	com TT NERDTree | TlistToggle

	" NERDTree.vim 에서 직접 수정 if &encoding == 'utf-8' endfi 
	"	let NERDTreeDirArrows = 0
	"	i
	"if &encoding != 'utf-8' 
		"let g:NERDTreeDirArrows=0
		"let g:NERDTreeDirArrowExpandable="+"
		"let g:NERDTreeDirArrowCollapsible="|"
	"endif

"/*}}}*/

" 뭔지 아직 파악안됨
"augroup vimrc_autocmds
"	autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"	autocmd BufEnter * match OverLength /\%81v.*/
"	화면 끝의 불필요한 공백 표시여부
"	autocmd BufEnter * highlight UnwantedSpaces ctermbg=darkgrey guibg=#darkgrey
"	autocmd BufEnter * match UnwantedSpaces /\s\+$/
"augroup END 


" 사용여부 고민 let g:miniBufExplMapWindowNavVim = 1  " Ctrl+[hjkl] 로 윈도우간 이동 가능
" 사용여부 고민 let g:miniBufExplMapWindowNavArrows = 1 " Ctrl+화살표로 윈도우간 이동 가능
" 사용여부 고민 let g:miniBufExplMapCTabSwitchBufs = 1 " Ctrl-Tab, Ctrl-Shift-Tab으로 버퍼간 스위칭... !! 짱이예욤!!
" 사용여부 고민 let g:miniBufExplModSelTarget = 1  " Ctrl-Tab로 버퍼간 스위칭 할 때 방향지정

if(filereadable($HOME . "compile/git/enplus/dotfiles/vimrc_plugin"))
	    :so $HOME/compile/git/enplus/dotfiles/vimrc_plugin
endif

" pathoction/vim-colors-solarized.giten 
execute pathogen#infect()
execute pathogen#helptags()

" Syntastic Recommend Setttings"{{{

let g:syntastic_loc_list_height = 4
"	let g:syntastic_loc_list_height = 4
"	let g:syntastic_auto_loc_list = 1
"	let g:syntastic_check_on_wq = 0
"	let g:syntastic_enable_signs=1
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"
let g:syntastic_python_python_exec = '/home/deplus/compile/python'
"}}}

let g:syntastic_c_checkers=['make']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*gbar
"set statusline+=%*

"let g:NERDTreeWinPos = "right" 

" Source Explorer 환경설정"{{{
"-----------------------------------------------------------------------"
"	nmap  <F4> :SrcExplToggle<CR>	
""	nmap  h					" 왼쪽 창으로 이동
"	nmap  j					" 하단(preview) 창으로 이동
"	nmap  k					" 상단 창으로 이동
"	nmap  l					" 오른쪽 창으로 이동

" 원래 설정되어있던 목록들 
	"	let g:SrcExpl_winHeight = 8		" SrcExpl 윈도우 높이 지정
	"	let g:SrcExpl_refreshTime = 100		" refreshing time = 100ms
	"	let g:SrcExpl_jumpKey = ""		" 해당 definition으로 jump
	"	let g:SrcExpl_gobackKey = ""		" back
	"	let g:SrcExpl_isUpdateTags = 0		" tag file update = off
"-----------------------------------------------------------------------""}}}
"
"let g:SuperTabDefaultCompletionType = "<C-n>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>

" AutoComplPop 환경설정"{{{
"-----------------------------------------------------------------------"
function! InsertTabWrapper()
	let col = col('.')-1
	if !col||getline('.')[col-1]!~'\k'
		return "\<Tab>"
	else 
		if pumvisible()
			return "\<C-n>"
		else
			return "\<C-n>\<C-p>"
		end
	endif
endfunction
"inoremap <Tab> <C-r>=InsertTabWrapper()<cr>

"highlight Pmenu ctermbg=blue
"highlight PmenuSel ctermbg=yellow ctermbg=black
"highlight PmenuSbar ctermbg=blue
"function! InsertTabWrapper()
"	let col = col('.') - 1
"	if !col || getline('.')[col - 1] !~ '\k'
"		return "\<Tab>"
"	else
"		return "\<C-p>"
"	endif
"endfunction
"
"inoremap <Tab> <C-r>=InsertTabWrapper()<cr>
"inoremap <S-Tab> <C-n>

"function! CleverTab()
"  if pumvisible()
"	return "\<C-N>"
"  endif
"  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"	return "\<Tab>"
"  elseif exists('&omnifunc') && &omnifunc != ''
"	return "\<C-X>\<C-O>"
"  else
"	return "\<C-N>"
"  endif
"endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>

"}}}


let moria_style = 'dark' " black ,dark , light, white
"colo moria
"
let g:NERDTreeWinSize=22
"au Filetype * setl fo-=ro " // 연결주석처리 막기 - set formatoptions

" EasyMotion Mininal Settings	"{{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>/ <Plug>(easymotion-overwin-f2)
nmap <C-?> <Plug>(easymotion-overwin-f)
"nmap <Leader>l <Plug>(easymotion-lineforward)
"nmap <Leader>h <Plug>(easymotion-linebackward)
"}}}

"setl fo-=ro
setlocal comments-=://
" // 연결주석처리 막기 - set formatoptions
let g:rainbow_active = 1

set t_Co=256

if &term =~ ("screen")
	if &term =~ ("256")
		set background=dark
		colorscheme gruvbox
	else
		colorscheme BusyBee
	"	hi CursorLine   cterm=NONE ctermbg=gray ctermfg=black guibg=darkred guifg=white
	"	hi CursorColumn cterm=NONE ctermbg=gray ctermfg=black guibg=darkred guifg=white
	endif
elseif &term == ("xterm")
	set background=dark
	colorscheme gruvbox
endif

hi Comment ctermfg=245

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

set mouse=n			" Use Mouse - Normal Mode 
"map <ScrollWheelUp> <C-Y>
"map <S-ScrollWheelUp> <C-U>
"map <ScrollWheelDown> <C-E>
"map <S-ScrollWheelDown> <C-D>
""You can also use Alt and Ctrl modifiers.

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" YouCompleteMe Settings
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
set updatetime=1000

" :Call ShowMacros() 형태로 호출
function! ShowMacros()
	10new
	exe 'r!' . 'grep -B 1 -E "^\s*let @" ~/.vimrc' 
	call cursor(1,1)
endfunction

"Dummy

"For Gvim Options - 그냥 gvim -u .gvimrc로 별도 읽어오기"{{{
"if &term == "builtin_gui"
"	colorscheme gruvbox
"	set background=light
"else
"	set background=dark
"endif"}}}


