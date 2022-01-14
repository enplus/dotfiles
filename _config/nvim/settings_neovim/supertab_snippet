" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"let g:SuperTabDefaultCompletionType = "<C-n>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>
"let g:acp_autoselectFirstCompletion = 0


let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
" let g:SuperTabContextDefaultCompletionType = "<c-n>"
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabDefaultCompletionType = "<c-n>"

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    " inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
    inoremap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>\<lt>c-p>")<cr>
  endif
endif
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


let g:ulti_expand_or_jump_res = 0
" let g:UltiSnipsJumpForwardTrigger="<c-f>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<C-Cr>"
" let g:UltiSnipsJumpBackwardTrigger=""

let g:UltiSnipsExpandTrigger="<C-CR>"


function! Ulti_ExpandOrJump_and_getRes()
  call UltiSnips#ExpandSnippetOrJump()
  return g:ulti_expand_or_jump_res
endfunction

inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>

" vimsnippets - Docs
let g:snips_author = "enplus"
let g:snips_email = "doublebind96@email.com"
let g:snips_github = "https://github.com/enplus"

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>
