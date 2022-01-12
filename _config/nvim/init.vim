set nocompatible
set hidden
	"filetype off                  " required

call plug#begin('~/.config/nvim/plugged')
	Plug 'ervandew/supertab'
	Plug 'junegunn/vim-easy-align'

	" Any valid git URL is allowed
	Plug 'https://github.com/junegunn/vim-github-dashboard.git'

	" Multiple Plug commands can be written in a single line using | separators
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

	" On-demand loading
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'jistr/vim-nerdtree-tabs'

	" Using a non-master branch
	" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

	" Plugin outside ~/.vim/plugged with post-update hook
	"Plug 'ctrlpvim/ctrlp.vim' -> replace fzf
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	" Plug 'dbext.vim'
	" Plug 'vim-scripts/SQLComplete.vim'

	"Completion
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

	" Plug 'w0rp/ale'  " SyntaxError Check

	Plug 'Shougo/neco-vim' | Plug 'Shougo/neco-syntax' " Vim Script Completion & Syntax

	"python
	""""Bundle 'Python-Syntax'
	"Optimized for Python ColorScheme "Bundle 'vim-scripts/vimbuddy.vim'
  " XXXXXX Plug 'davidhalter/jedi'  " for nvim

	" Plug 'zchee/deoplete-zsh' "zsh Completion
  Plug 'davidhalter/jedi-vim'  " for vim not nvim
  Plug 'deoplete-plugins/deoplete-jedi' " Python Completion for vim

	Plug 'tmhedberg/SimpylFold'
	Plug 'tweekmonster/braceless.vim'
	"""Plug 'Pydiction'


	Plug 'zchee/deoplete-clang' " Clang Completion
	"Plug 'python-mode/python-mode'

	" Haskell
	Plug 'Shougo/vimproc', { 'do': 'make' }
	Plug 'eagletmt/ghcmod-vim'  " linter for haskell
	Plug 'eagletmt/neco-ghc'    " completion for haskell

	Plug 'godlygeek/tabular'
	Plug 'itchyny/vim-haskell-indent'  " for indent
	Plug 'neovimhaskell/haskell-vim'   " for syntaxHighlighting - except indent
  Plug 'Twinside/vim-haskellConceal' " for hsNiceOperator
  Plug 'parsonsmatt/intero-neovim', { 'for' : ['haskell'] }
  Plug 'octol/vim-hindent', { 'for' : ['haskell'] }   " for gq
  Plug 'Twinside/vim-hoogle'

  Plug 'aloiscochard/sarsi' "Junp to Error for TmUX

	" Plug 'dag/vim2hs'
	" Plug 'pbrisbin/vim-syntax-shakespeare'
  " Plug 'bitc/vim-hdevtools'
	" Plug 'Konfekt/FastFold'

  " Scala
  Plug 'derekwyatt/vim-scala'

  " Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd server && xbuild' } " for C# CSharp
	Plug 'OrangeT/vim-csharp'

  " Installs vim-dispatch (required to launch OmniSharp server) vim상에서 :Make 명령 제공 """
  Plug 'tpope/vim-dispatch'
  " Installs this source
  Plug 'https://gitlab.com/mixedCase/deoplete-omnisharp.git'

	"visual - colorscheme,syntax
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'edkolev/tmuxline.vim'
	Plug 'edkolev/promptline.vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'morhetz/gruvbox'
	Plug 'altercation/vim-colors-solarized'
	Plug 'octol/vim-cpp-enhanced-highlight'

	"javascript -
	Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
	Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
	Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
	Plug 'pangloss/vim-javascript'
	" Plug 'vim-sensible'
	Plug 'Valloric/MatchTagAlways'

	"Plug 'scrooloose/syntastic' " change to -> neomake
	" Plug 'neomake/neomake'

	" mark 표시
	Plug 'kshenoy/vim-signature'

	"REPL Send for TMUX
	Plug 'epeli/slimux'
	Plug 'christoomey/vim-tmux-navigator'

	"For editing
	" 주석 처리 - gcc 현재라인 gci} 블럭 등
	Plug 'tpope/vim-commentary'
	Plug 'milkypostman/vim-togglelist'
	" Plug 'blueyed/vim-qf_resize'

	" .으로 반복 작업
	Plug 'tpope/vim-repeat'

	"Plug 'vim-scripts/YankRing.vim'

	" For refactoring Tool
	Plug 'terryma/vim-multiple-cursors'
	Plug 'tommcdo/vim-exchange'  "cxx with repeat cxiw
	Plug 'tpope/vim-surround' " ds( - () 괄호 제거 cs'( '를 (로 변경

	"markdown
	Plug 'suan/vim-instant-markdown'

	"git
	Plug 'airblade/vim-gitgutter'

	" 차이점을 + 표기
	Plug 'mhinz/vim-signify'

	Plug 'majutsushi/tagbar'
  Plug 'udalov/kotlin-vim'

  Plug 'smitajit/bufutils.vim'  " https://github.com/smitajit/bufutils.vim
" Initialize plugin system

call plug#end()

	"Bundle List"{{{
	"	Bundle 'xolox/vim-notes'
	"	Bundle 'xolox/vim-misc'

		"WindowsManager
		"Bundle 'winmanager'

		"Make,Build,Compile
		" Bundle 'autocomp.vim'
		" Bundle 'OmniCppComplete'
		" Bundle 'AutoComplPop'
		" Bundle 'Valloric/ListToggle'
		" Bundle 'vim-addon-manager'
		" Bundle 'vim-addon-ocaml'

		" vim상에서 :Make 명령 제공 """Bundle 'tpope/vim-dispatch'- neomake로 대체

		"""Bundle 'chrisbra/vim-diff-enhanced'
		"""Bundle 'vim-scripts/YankRing.vim'

		" csv
		" Bundle 'chrisbra/csv.vim'

		"""Bundle 'gundo'

		"http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

		"pathogen install
		"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

		"cd ~/.vim/bundle
		"git clone git://github.com/tpope/vim-dispatch.git
		"git clone git://github.com/tpope/vim-surround.git
		"git clone https://github.com/oblitum/rainbow
		""}}}

filetype plugin indent on    " required

syntax enable
"}}}
"
" Default Settings: /*{{{*/
	set number					" nu
	set numberwidth=4			" nuw - 줄 넘버 표시 너비 설정(set nuw)
	set autoindent				" ai
	set smartindent				" si
	set cindent			  		" ci - c style index
	set history=1000			" 명령어에 대한 히스토리를 100개까지
	set tabstop=4				" tab을 4칸으로
	set softtabstop=4			" sts - tab >> space no ???
	set shiftwidth=4			" sw - shift를 4칸으로 ( >, >>, <, << 등의 명령어)
	set noexpandtab				" noet - Tab 을 Tab으로 씀
	set	showcmd
	set showmatch				" 매칭되는 괄호를 보여줌

  set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
  set wildmode=longest:full,full
  " set wildmode=list:longest,full " 설정 방법 좀더 파악
	set wildmenu				" wmnu - 명령어 tab으로 완성시 리스트를 보여준다(help 등)

	set hlsearch				" 검색시 하이라이트(색상 강조)
	set incsearch				" 점진적 검색

	set fileencodings=ucs-bom,utf-8,euc-kr,cp949	" fencs
	set clipboard=unnamedplus

	set backspace=indent			" Vi compatible
"	set bs=indent,eol,start		" backspace로 이전줄 편집 가능
	set sol						" 이동시 줄 시작으로 자동 이동
	set nowrapscan				" 검색시 끝에서 처음으로 돌아가지 않음
	set foldmethod=marker		" fdm - manual, indent, expr, marker, syntax, diff
	set foldmarker={{{,}}}		" fmr -
	set nofoldenable			" fold open(default)
"	set colorcolumn=100		" 세로 줄 세팅 - 구분용

	set ignorecase				" For search - Upper/Lower case ignore
"
	set cursorline
	set splitright				" Split new screen pos - right
	set splitbelow				" Split new screen pos - bottom
	set whichwrap=b,s,<,>,[,]
	"}}}

" {{{ FileType List Settings
"au FileType * setl fo-=cro

" let $PATH = $PATH . ':' . expand('~/.cabal/bin')
" }}}

" 마지막 편집 위치 기억"{{{
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "norm g`\"" |
\ endif"}}}

"set nowrap
"set listchars=extends:>,precedes:<

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


" Install pathogen
"execute pathogen#infect()
"execute pathogen#helptags()

set laststatus=2
set tabline=2

let w:jumpbacktohere = 1

function! ToggleNERDTreeAndTagbar()
	let NERDTree_close = (bufwinnr('NERD_tree') == -1)
	let Tagbar_close   = (bufwinnr('__Tagbar__') == -1)

	TagbarToggle
	NERDTreeToggle

	if NERDTree_close && Tagbar_close
		wincmd K
		wincmd b
		wincmd L
		wincmd h
		exe 'vertical resize 30'
	endif
endfunction

"For Gvim Options 그냥 gvim -u .gvimrc로 별도 처리

set t_Co=256
let g:solarized_termcolors=256

" if &diff
" 	let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
" endif

if has ("gui_running")
  echom 'Gui_running'
else
	set background=dark
	colorscheme gruvbox
endif

"set mouse=n			" Use Mouse - Normal Mode
let g:indentLine_char = '┆'
let g:indentLine_color_term = 'lightblue'
let g:indentLine_color_gui = 'lightblue'

" :Call ShowMacros() 형태로 호출
function! ShowMacros()
	10new
	exe 'r!' . 'grep -B 1 -E "^\s*let @" ~/.vimrc'
	call cursor(1,1)
endfunction

"For Gvim Options - 그냥 gvim -u .gvimrc로 별도 읽어오기"{{{
" QuickFix 의 라인 설정
" au FileType qf call AdjustWindowHeight(3, 10)
" function! AdjustWindowHeight(minheight, maxheight)
" 	exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
" endfunction

" let g:qf_resize_min_height=5
" let g:qf_resize_max_height=7

let g:virtualenv_auto_activate = 1

" Python Configure
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_sort = 0
"let g:tagbar_vertical = 40
let g:tagbar_map_showproto = "<leader>"
let g:tagbar_map_previewwin = "]"
let g:tagbar_previewwin_pos = "rightbelow"

" Unite Configure
"let g:unite_source_history_yank_enable = 1
""""" nnoremap <leader>y :Unite history/yank<cr>
""""" nnoremap <leader><S-b> :Unite -quick-match buffer<cr>

"		function ClosePair(char)
"		if getline('.')[col('.') - 1] == a:char
"		return "\<Right>"
"		else
"		return a:char
"		endif endf

" highlight Config
highlight Pmenu ctermbg=black
highlight PmenuSel ctermfg=green ctermbg=darkgray
highlight LineNr ctermfg=240
"highlight PmenuSbar ctermbg=black
"highlight Normal ctermbg=NONE		"Black Backgroud (System Color)

"augroup project
"autocmd!
	"autocmd BufRead,BufNewFile *.h,*.cpp set filetype=c.doxygen
"augroup END

" Terminal Scrollback Buffer - 터미널 에뮬 한정
let g:terminal_scrollback_buffer_size = 100000

" https://virgile.anbuco.fr/software/vim-ocaml.txt

let g:nerdtree_tabs_open_on_console_startup=1

" ================ Haskell Settings ========================
" ./settings_neovim/additional-haskell.vimrc

" ================ Ocaml Settings ========================
" ./settings_neovim/additional-ocaml.vimrc

" ================ Startup Settings ========================

" ===========================================================
" 2020.10.13 임시
" let g:use_ale#autocomp= 0

" if g:use_ale#autocomp == 1
"   let g:deoplete#enable_at_startup = 0
"   autocmd InsertEnter * call deoplete#enable()
"   let g:ale_completion_enabled = 1
" else
"   let g:deoplete#enable_at_startup = 1
"   let g:ale_completion_enabled = 0
" endif
let g:ale_completion_enabled = 0

"""""" ale-if문 대체
set runtimepath+=~/.config/nvim/plugged/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
" ===========================================================

" let g:quickfixsize = 7
" let g:toggle_list_copen_command="copen " . g:quickfixsize

func! ActivateWindowByName(name)
	let l:bufid = bufnr(a:name)
	let l:winids = win_findbuf(l:bufid)
	call win_gotoid(l:winids[0])
endfunc

" ================ do Last - Custom Settings ========================
source $HOME/.config/nvim/settings_neovim.vimrc


"https://github.com/smitajit/bufutils.vim
"https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
