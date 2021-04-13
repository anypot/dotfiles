execute pathogen#infect()
syntax on
filetype plugin indent on

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  set t_Co=256
  set background=dark
  source ~/.vimrc_background
endif

set number
set cursorline

au BufRead /tmp/mutt-* set tw=72
