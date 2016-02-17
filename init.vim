" Execute Pathogen-installed plugins
execute pathogen#infect()

set background=dark
colorscheme hybrid

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
set guifont=Source\ Code\ Pro\ for\ Powerline

" Bbye
nnoremap <leader>q :Bdelete<CR>

" Comment on cmd-/
map <D-/> :Commentary<CR>
inoremap <D-/> <Esc>:Commentary<CR>==gi
vnoremap <D-/> :Commentary<CR>gv=gv

" Ctrl+P
let g:ctrlp_map = '<D-p>'
let g:ctrlp_cmd = 'CtrlP'

" CtrlP auto cache clearing.
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" vim-jsx
let g:jsx_ext_required = 0

" vim-multiple-cursors
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-n>'

" resolve neocomplete conflict
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" neocomplete
let g:neocomplete#enable_at_startup=1

" NERDTree
map <D-Bslash> :NERDTreeToggle<CR>
inoremap <D-Bslash> <Esc>:NERDTreeToggle<CR>==gi
vnoremap <D-Bslash> :NERDTreeToggle<CR>gv=gv

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open a NERDTree automatically on vim startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
