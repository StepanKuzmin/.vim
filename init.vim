set background=dark
colorscheme hybrid

set number
set expandtab
set tabstop=2
set splitright
set shiftwidth=2
set encoding=utf-8
set wildignore+=node_modules

let mapleader=','

map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Remove scrollbars
set guioptions-=L
set guioptions-=r

" Disable error bells
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

execute pathogen#infect()

" Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Ack
nmap <leader>a :Ack 
let g:ackprg = 'ag --nogroup --nocolor --column'

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme='hybrid'
let g:airline_powerline_fonts=1
let g:airline_symbols.linenr = '¶'
" let g:airline#extensions#tabline#enabled = 1
set guifont=Source\ Code\ Pro\ for\ Powerline

" vim-jsx
let g:jsx_ext_required = 0

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open a NERDTree automatically on vim startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
