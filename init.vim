" Execute Pathogen-installed plugins
execute pathogen#infect()

set background=dark
colorscheme hybrid
let g:hybrid_custom_term_colors = 1

set hid                      " hide abandoned buffers
set ruler                    " show the cursor position
set mat=2                    " show matching brackets
set number                   " show line numbers
set mouse=a                  " allow use of mouse
set ttyfast                  " optimize for fast terminal connections
set nobackup                 " disable backups
set hlsearch                 " highlight searches
set expandtab                " use spaces
set tabstop=2                " ident two
set showmatch                " show matching brackets
set incsearch                " highlight dynamically as pattern is typed
set ignorecase               " ignore case of searches
set cursorline               " highlight current line
set splitright               " open new buffers on right
set splitbelow               " open new buffers on bottom
set shiftwidth=2             " ident two
set laststatus=2             " always display status
set nocompatible             " make Vim more useful
set encoding=utf-8           " use utf-8 encoding
set wildignore+=node_modules " ignore node_modules

set nobackup
set noswapfile
set nowritebackup

" Move between buffers
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

nnoremap <C-Tab> :bnext<CR>
nnoremap <S-C-Tab> :bprevious<CR>
inoremap <C-Tab> <Esc> :bnext<CR>==gi
inoremap <S-C-Tab> <Esc> :bprevious<CR>==gi
vnoremap <C-Tab> :bnext<CR>gv=gv
vnoremap <S-C-Tab> :bprevious<CR>gv=gv

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
set guioptions+=c

" Disable error bells
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" Ack
nmap <leader>s :Ack<Space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme='hybrid'
let g:airline_powerline_fonts=1
let g:airline_symbols.linenr = '¶'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set guifont=Fira\ Mono\ for\ Powerline

" Bbye
nnoremap <leader>q :Bdelete<CR>

" Comment on cmd-/
map <D-/> :Commentary<CR>
inoremap <D-/> <Esc>:Commentary<CR>==gi
vnoremap <D-/> :Commentary<CR>gv=gv

" vim-jsx
let g:jsx_ext_required = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif
