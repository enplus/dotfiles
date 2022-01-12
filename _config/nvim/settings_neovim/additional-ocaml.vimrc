" ### Ocaml
" Get the opam directories:
let opam_prefix_ = system('echo -n "$(opam config var prefix)"')
let opam_prefix = substitute(opam_prefix_,'^\s*\(.\{-}\)\s*$', '\1', '') " This strips the string
"set rtp^="/home/deplus/.opam/4.03.0/share/ocp-indent/vim"

" #### merlin
if filereadable(opam_prefix . '/share/ocamlmerlin/vim/doc/merlin.txt')
    exec 'set rtp+=' . opam_prefix . '/share/ocp-indent/vim'
    exec 'set rtp+=' . opam_prefix . '/share/ocamlmerlin/vim'
    exec 'set rtp+=' . opam_prefix . '/share/ocamlmerlin/vimbufsync'
    exec 'helptags ' . opam_prefix . '/share/ocamlmerlin/vim/doc'
endif
if filereadable(opam_prefix . '/share/merlin/vim/doc/merlin.txt')
    exec 'set rtp+=' . opam_prefix . '/share/ocp-indent/vim'
    exec 'set rtp+=' . opam_prefix . '/share/merlin/vim'
    exec 'helptags ' . opam_prefix . '/share/merlin/vim/doc'
endif

" #### More OCaml files:
autocmd BufNewFile,BufReadPost *.eliom set filetype=ocaml
autocmd BufNewFile,BufReadPost *.eliomi set filetype=ocaml
autocmd BufNewFile,BufReadPost *.atd set filetype=ocaml

" #### def's ocp-indent mode
" (I use NeoBundle, but it works with other package managers)
"NeoBundle 'def-lkb/ocp-indent-vim'
let g:ocp_indent_args='-c strict_with=always,with=0,strict_comments=false'

" #### Some cool optional stuff
fun! OCaml_additional()
    " For the plugin 'tpope/vim-commentary':
    setl commentstring=(*\ %s\ *)
    " For indenting and folding
    set foldmethod=indent
    set shiftwidth=2
    map  <buffer> <leader>bmw obegin match  with<cr>end<esc>k2==0EEl
    nmap <buffer> <leader>om o>>= fun  -><esc>==0t-
    nmap <buffer> <leader>ou o>>= fun () -><esc>==
    nmap <buffer> <leader>ad a(* *)<esc>hh
    nmap <buffer> <leader>op o\|  -><esc>==^l
    set cc=101 " display 81st column
	set ts=2 sts=2 sw=2

    " It's a merlin thing, but who cares:
"   nmap <buffer> <leader>l :MerlinLocate<cr>
    nmap <buffer> <leader>d :MerlinDestruct<cr>
    nmap <buffer> <leader><leader> :MerlinTypeOf<cr>
    nmap <buffer> <leader>r :MerlinRename 

	hi SyntasticError       cterm=bold ctermbg=167 gui=bold guifg=#fb4934 guibg=bg
	" hi SyntasticErrorLine   cterm=underline
	hi SyntasticErrorSign   ctermfg=160
	hi SyntasticWarningSign ctermfg=220

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 0
	let g:syntastic_check_on_open = 0
	let g:syntastic_check_on_wq = 0

endfun

autocmd FileType ocaml call OCaml_additional()
