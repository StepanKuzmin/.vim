" Execute Pathogen-installed plugins
execute pathogen#infect()

set background=dark
colorscheme hybrid

set hid           " hide abandoned buffers
set ruler         " show the cursor position
set mat=2         " show matching brackets
set number        " show line numbers
set mouse=a       " allow use of mouse
set ttyfast       " optimize for fast terminal connections
set nobackup      " disable backups
set hlsearch      " highlight searches
set expandtab     " use spaces
set tabstop=2     " ident two
set showmatch     " show matching brackets
set incsearch     " highlight dynamically as pattern is typed
set ignorecase    " ignore case of searches
set cursorline    " highlight current line
set splitright    " open new buffers on right
set shiftwidth=2  " ident two
set laststatus=2  " always display status
set nocompatible  " make Vim more useful
set encoding=utf-8 " use utf-8 encoding
set wildignore+=node_modules " ignore node_modules

" Map moving between buffers
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Move lines using Shift+Up/Down
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

" Trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Remove scrollbars
set guioptions-=L
set guioptions-=r

" Disable error bells
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

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
let g:airline#extensions#tabline#enabled = 1
set guifont=Source\ Code\ Pro\ for\ Powerline

" Ctrl+P
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-jsx
let g:jsx_ext_required = 0

" vim-multiple-cursors
let g:multi_cursor_start_key='<C-n>'

" NERDTree
map <leader>nt :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open a NERDTree automatically on vim startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
