" Airline Settings"{{{
"
" 상단Tabline Setting
let g:airline#extensions#tabline#enabled = 1
" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_enabled=1
let g:airline_detect_paste=1
let g:airline_powerline_fonts=1
" let g:airline_theme='jellybeans'
" let g:airline_theme='gruvbox'
let g:airline_theme='cool'

"tmuxline_preset - no used
let g:airline#extensions#tmuxline#enabled = 0

function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode',' ','branch'])
	let g:airline_section_b = airline#section#create_left(['ffenc','%f'])
	let g:airline_section_c = airline#section#create(['filetype'])
	let g:airline_section_x = airline#section#create(['%P'])
	let g:airline_section_y = airline#section#create(['%B'])
	let g:airline_section_z = airline#section#create_right(['%l',' ','%c'])
endfunction

autocmd VimEnter * call AirlineInit()


" function! AOverride()
" 	call a:l.add_section(['StatusLine', ' mode ')
" 	" call a:l.add_section(['ffenc','%f'])
" 	" call a:l.add_section(['filetype'])
" 	" call a:l.add_section(['%P'])
" 	" call a:l.add_section(['%B'])
" 	" call a:l.add_section(['%l',' ','%c'])
" endfunction

" call airline#add_statusline_func('AOverride')

" autocmd VimEnter * call AirlineInit()

"let g:tmuxline_theme = 'jellybeans'
"let g:tmuxline_preset = 'powerline'
"let g:tmuxline_preset = {
"	\'a'    : '#S',
"	\'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
"	\'win'  : ['#I', '#W'],
"	\'cwin' : ['#I', '#W', '#F'],
"	\'x'    : '#(date)',
"	\'y'    : ['%R', '%a', '%Y'],
"	\'z'    : '#H'}
"
"let g:tmuxline_separators = {
"	\ 'left' : '',
"	\ 'left_alt': '>',
"	\ 'right' : '',
"	\ 'right_alt' : '<',
"	\ 'space' : ' '}
" other themes available in autoload/tmuxline/themes/*
