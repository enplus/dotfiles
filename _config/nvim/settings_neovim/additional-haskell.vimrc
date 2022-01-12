" ### Haskell

" redundant from after/ftplugin/haskell.vim

" for neco-ghc(Disable haskell-vim omnifunc)
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Ghc-mod 형변환 세부내용 보는거
let g:necoghc_use_stack = 1
let g:necoghc_enable_detailed_browse = 1
" let g:ghcmod_use_basedir="/home/deplus/compile/shell"  "vim(ghc-mod) use stack

" #### Some cool optional stuff
fun! Haskell_additional()
  " For the plugin 'tpope/vim-commentary':
  " setl commentstring={-\ %s\ -}
  " setl commentstring=--\ %s

  set expandtab
  set ts=2 sts=2 sw=2

  " For indenting and folding
  " set cc=81 " display 81st column

  hi ghcmodType cterm=bold ctermfg=235 ctermbg=109 gui=bold guifg=#282828 guibg=#83a598
  " hi ghcmodType ctermbg=yellow
  let g:ghcmod_type_highlight = 'ghcmodType'
  let g:ghcmod_hlint_options = ['--ignore=Redundant $']

  " nnoremap <silent> <F3> :GhcModType<CR>
  nmap <silent> <F3> :GhcModType<CR>

  nmap <silent> tw :GhcModTypeInsert<CR>   "Type write - Error이 없을시 동작
  nmap <silent> tq :GhcModType<CR>
  nmap <silent> td :GhcModExpand<CR>
  " au FileType haskell nmap <silent> ts :GhcModSplitFunCase<CR>
  nmap <silent> tc :GhcModTypeClear<CR>

  "Type write - Error이 없을시 동작
  nmap <leader>w :GhcModTypeInsert<CR>
  nmap <leader>c :GhcModSplitFunCase<CR>
  nmap <leader>s :GhcModSigCodegen<CR>

  let g:haskell_tabular = 1

  vmap <silent> a= :Tabularize /=<CR>
  vmap <silent> a; :Tabularize /::<CR>
  vmap <silent> a- :Tabularize /-><CR>
  " vmap <silent> a- :Tabularize haskell_pattern_arrows<CR> :Tabularize haskell_do_arrows<CR>

" let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" if has("gui_running")
" 	imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
" 	if has("unix")
" 		inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
" 	endif
" endif

  " for Neovimhaskell {{{
  let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
  let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
  let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
  let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
  let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
  let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
  " let g:haskell_indent_disable = 1          " not use indent  (당분간은ichyny로)
  let g:haskell_classic_highlighting = 1
  let g:haskell_indent_if = 3
  let g:haskell_indent_case = 2
  let g:haskell_indent_let = 4
  let g:haskell_indent_where = 6
  let g:haskell_indent_before_where = 2
  let g:haskell_indent_after_bare_where = 2
  let g:haskell_indent_do = 3
  let g:haskell_indent_in = 1
  let g:haskell_indent_guard = 2
  let g:haskell_indent_case_alternative = 1
  let g:cabal_indent_section = 2

  " }}}
endfun

fun! Haskell_gruvbox() " {{{ ~/.vim/syntax/haskell.vim
  " https://github.com/phaazon/gruvbox/commit/189c1ff8397f7cd8ab829f371f3d6bfda726044b
  if &background == 'light'
    echom 'WTF'
  else
    hi! link haskellImportKeywords GruvboxAqua

    hi! link haskellType GruvboxGreen
    hi! link haskellIdentifier GruvboxOrange
    hi! link haskellSeparator GruvboxFg4
    hi! link haskellDelimiter GruvboxGray

    hi! link haskellOperators GruvboxRedBold
    hi! link haskellStatement GruvboxPurple

    hi! link haskellConditional GruvboxRed
    hi! link haskellLet GruvboxRed
    hi! link haskellDefault GruvboxRed
    hi! link haskellWhere GruvboxRed
    hi! link haskellBottom GruvboxRedBold
    hi! link haskellDeclKeyword GruvboxOrange
    hi! link haskellDecl GruvboxOrange
    hi! link haskellDeriving GruvboxPurple

    hi! link haskellNumber GruvboxAqua
    hi! link haskellPragma GruvboxRedBold

    hi! link haskellTH GruvboxAquaBold
    hi! link haskellForeignKeywords GruvboxGreen
    hi! link haskellKeyword GruvboxRed
    hi! link haskellFloat GruvboxAqua
    hi! link haskellInfix GruvboxPurple
    hi! link haskellQuote GruvboxGreenBold
    hi! link haskellShebang GruvboxYellowBold
    hi! link haskellLiquid GruvboxPurpleBold
    hi! link haskellQuasiQuoted GruvboxBlueBold
    hi! link haskellRecursiveDo GruvboxPurlpe
    hi! link haskellQuotedType GruvboxRed
    hi! link haskellPreProc GruvboxFg4
    hi! link haskellTypeRoles GruvboxRedBold
    hi! link haskellTypeForall GruvboxRed
    hi! link haskellPatternKeyword GruvboxBlue

    hi! link hsNiceOperator GruvboxRed
    hi! link Conceal GruvboxRed

    hi! link hs_DeclareFunction GruvboxOrange
    hi! link hs_FunctionName GruvboxPurple
    hi! link hs_OpFunctionName GruvboxPurple

    " ??? why cleared?
    hi! link haskellBackpackStructure GruvboxAquaBold
    hi! link haskellBackpackDependency GruvboxAquaBold

    hi! link haskellQuasiQuote GruvboxGreenBold
    hi! link haskellQuoted  xx

    hi! link haskellStatic  GruvboxRedBold
    hi! link haskellBlock   GruvboxYellowBold
    hi! link haskellTypeSig GruvboxYellowBold
    hi! link haskellForeignImport GruvboxAquaBold

    hi! link haskellImport  GruvboxPurpleBold

    " hi! link haskellParens  xx
    " hi! link haskellRecordField xx
    " hi! link haskellBrackets xx
    " hi! link haskellForall  xx
    " hi! link haskellArrowSyntax xx

    hi! link haskellTHBlock GruvboxYellowBold
    hi! link haskellTHDoubleBlock GruvboxYellowBold
  endif

  set conceallevel=2
endfun " }}}

autocmd FileType haskell call Haskell_additional()
autocmd FileType haskell call Haskell_gruvbox()

" let &statusline = '[%{GhcModTypeLastStatus()}] ' . &statusline
" function! GhcModTypeLastStatus()
"   return get(w:, 'ghcmod_type_last_status', 1) ? 'ghcmod#type OK' : 'ghcmod#type FAIL'
" endfunction

" command! GhcModTypeWithStatusBar call s:type_with_status_bar()
" function! s:type_with_status_bar()
"   let [l:_, l:type] = ghcmod#type()   " 함수 잘못됨.
"   if empty(l:type)
"     " ghcmod#type() failed
"     let w:ghcmod_type_last_status = 0
"   else
"     let w:ghcmod_type_last_status = 1
"     echo l:type
"   endif
" endfunction
" nmap <leader>tt :GhcModTypeWithStatusBar<CR>

set completeopt-=preview
set smarttab

" let $PATH = $PATH . ':' . expand('~/compile/shell')

" intero Setup{{{
"" Prefer starting Intero manually (faster startup times)
let g:intero_start_immediately = 0
" Use ALE (works even when not using Intero)
let g:intero_use_neomake = 0
let g:intero_type_on_hover = 1
let g:intero_window_size=10

" OPTIONAL: Make the update time shorter, so the type info will trigger faster.
set updatetime=1000
" Reloading (pick one) Automatically reload on save
au BufWritePost *.hs if g:intero_started==1 | execute "InteroReload" | endif

augroup interoMaps
  au!

  " au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  " au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  au FileType haskell nnoremap <leader>t <Plug>InteroGenericType
  au FileType haskell nnoremap <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
  au FileType haskell nnoremap <silent> <leader>iu :InteroUses<CR>
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>

  au FileType haskell tnoremap <silent> <A-Down> <C-\><C-n>:InteroHide<CR>
  au FileType haskell nnoremap <silent> <A-Down> <C-\><C-n>:InteroHide<CR>

  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR><Esc>:call Haskell_gruvbox()<CR><C-w>j<Esc>:set wfh<CR>
  " au FileType haskell nnoremap <silent> <C-Up> :InteroOpen<CR><Esc>:call Haskell_gruvbox()<CR><C-w>j<Esc>:set wfh<CR>
  au FileType haskell nnoremap <silent> <A-Up> :InteroOpen<CR><Esc>:call Haskell_gruvbox()<CR><C-w>j<Esc>:set wfh<CR>
  " au FileType haskell noremap <silent> <A-Up> :InteroOpen<CR><Esc>:call Haskell_gruvbox()<CR>
  " au FileType haskell noremap <silent> <A-Up> :InteroOpen<CR><Esc>:call Haskell_gruvbox()<CR>
  "set WinFixHeight - InteroHeight

  "Quick Direct
  " au WinEnter * if &buftype ==# 'terminal' && winnr('$') > 1 && expand('%:f') ==# 'Intero' | :startinsert | endif

  " au WinEnter * call s:intero_buf()

	" fun! s:intero_buf()
		" " if expand('%:f') ==# 'intero'
		" " if &buftype ==# 'terminal'
		" if &buftype ==# 'terminal' && expand('%:f') ==# 'Intero'
			" if winnr('$') == 1 | quit | endif
		" endif
	" endfun
augroup END"}}}


" vim-hindet - 사용법 gq
let g:hindent_style = "gibiansky"

