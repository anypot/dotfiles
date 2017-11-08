execute pathogen#infect()
syntax on
filetype plugin indent on

let base16colorspace=256
set t_Co=256
set background=dark
colorscheme base16-solarized-dark

set number
set cursorline

map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

au BufRead /tmp/mutt-* set tw=72
