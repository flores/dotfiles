"set cindent
"set smartindent
"set autoindent
set softtabstop=2
set shiftwidth=2
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

syntax enable
filetype plugin on
filetype indent on

set ignorecase
set magic

set background=light
color rainbow_autumn

highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\|\t/
