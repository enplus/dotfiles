" #### Some cool optional stuff
let hostname = system("hostname")
  if hostname[:3] ==? "e460"
		let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
		let g:deoplete#sources#clang#clang_header ='/usr/lib/clang'
  elseif hostname[:2] ==? "dev"
		let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-6.0/lib/libclang-6.0.so"
		let g:deoplete#sources#clang#clang_header ='/usr/lib/llvm-6.0/lib/clang/6.0.0/include'
  elseif hostname[:5] ==? "office"
		let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-3.8/lib/libclang.so"
		let g:deoplete#sources#clang#clang_header ='/usr/lib/llvm-3.8/include'
  endif
		let g:deoplete#sources#syntax#min_keyword_length = 2
"let g:deoplete#lock_buffer_name_pattern = '\*ku\*'

fun! Deoplete()

	hi SyntasticError       cterm=bold ctermbg=167 gui=bold guifg=#fb4934 guibg=bg
	" hi SyntasticErrorLine   cterm=underline
	hi SyntasticErrorSign   ctermfg=160
	hi SyntasticWarningSign ctermfg=220

	" redundant
	" set completeopt+=noinsert,noselect
	" set completeopt=menuone,preview
	set completeopt=menuone,menu,longest,preview

	"hi Pmenu    gui=NONE    guifg=#c5c8c6 guibg=#373b41
	"hi PmenuSel gui=reverse guifg=#c5c8c6 guibg=#373b41

	"let g:deoplete#source#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang-3.8.so'
	" let g:deoplete#enable_smart_case = 1
	" if !exists('g:deoplete#omni#input_patterns')
	" 	let g:deoplete#omni#input_patterns = {}
	" endif

	" Let <Tab> also do completion
	" inoremap <silent><expr> <Tab>
	" \ pumvisible() ? "\<C-n>" :
	" \ deoplete#mappings#manual_complete()

	"deoplete tab-complete
	" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

	" Close the documentation window when completion is done
	" let g:deoplete#disable_auto_complete = 1
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endfun

call Deoplete()
"autocmd FileType c,cpp call Deoplete()

" --- for javascript"{{{
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = ['tern#Complete', 'jspc#omni']

let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
"}}}


" --- for python-jedi"{{{

" completion delay
call deoplete#custom#option({
\ 'auto_complete_delay': 10,
\ })

" jedi
" if error -> pip install jedi==0.17.2
let g:python_version = matchstr(system("python --version | cut -f2 -d' '"), '^[0-9]')
if g:python_version =~ 3
    let g:python_host_prog = "/usr/bin/python2"
else
  let hostname = system("hostname")
    if hostname[:1] ==? "op"
      let g:python3_host_prog = "/usr/bin/python3"
    else
      let g:python3_host_prog = "/opt/local/anaconda3/bin/python3"
    endif
endif

"let g:deoplete#sources#clang#libclang_path = "/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
""}}}
