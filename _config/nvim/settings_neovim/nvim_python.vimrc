
set textwidth=120  " for linewrap

let g:anaconda2_path="/opt/local/anaconda2"

if empty(glob(g:anaconda2_path))
  let g:python_host_prog='/usr/bin/python2'
endif

let g:python3_host_prog='/opt/local/anaconda3/bin/python3'

" for deoplete-jedi
let g:deoplete#sources#jedi#statement_length = 80
"": Sets the maximum length of completion description text. If this is exceeded, a simple description is used instead. Default: 50
let g:deoplete#sources#jedi#enable_cache = 1   "Enables caching of completions for faster results. Default: 1
let g:deoplete#sources#jedi#python_path = g:python3_host_prog

let g:deoplete#sources#jedi#enable_typeinfo = 0
" let g:deoplete#sources#jedi#enable_short_types: Enables short completion types. Default: 0
" let g:deoplete#sources#jedi#short_types_map: Short types mapping dictionary. Default: { 'import': 'imprt', 'function': 'def', 'globalstmt': 'var', 'instance': 'var', 'statement': 'var', 'keyword': 'keywd', 'module': 'mod', 'param': 'arg', 'property': 'prop', 'bytes': 'byte', 'complex': 'cmplx', 'object': 'obj', 'mappingproxy': 'dict', 'member_descriptor': 'cattr', 'getset_descriptor': 'cprop', 'method_descriptor': 'cdef', }
" let g:deoplete#sources#jedi#python_path: Set the Python interpreter path to use for the completion server. It defaults to "python", i.e. the first available python in $PATH. Note: This is different from Neovim's Python (:python) in general.
" g:deoplete#sources#jedi#extra_path: A list of extra paths to add to sys.path when performing completions.
" g:deoplete#sources#jedi#ignore_errors: Ignore jedi errors for completions. Default: 0
" g:deoplete#sources#jedi#ignore_private_members: Ignore private members from completions. Default: 0

" if error -> python3 -m pip install --user --upgrade pynvim
" let g:jedi#force_py_version = 2 or let g:jedi#loader_py_version = 2

" let g:deoplete#sources#jedi#ignore_errors = v:true

" disable autocompletion, because we use deoplete for completion
let g:deoplete#sources#jedi#show_docstring = 0 "Shows docstring in preview window. Default: 0

let g:jedi#auto_close_doc = 0
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_templates = 1

syntax keyword pythonBuiltinFunc debuginfo pprint

""" JEDI USAGE

" <leader>d: go to definition
" K: check documentation of class or method
" <leader>n: show the usage of a name in current file
" <leader>r: rename a name
" 이걸로 해결
" pip install jedi==0.17.2
