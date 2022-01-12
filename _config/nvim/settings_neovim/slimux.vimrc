let g:slimux_select_from_current_window = 1
let g:slimux_python_ipython = 1
let g:slime_target = "tmux"

map <C-c><C-c> :SlimuxREPLSendLine<CR>
map <C-c><C-r> :SlimuxShellLast<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
