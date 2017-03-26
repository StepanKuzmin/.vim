call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'moll/vim-bbye'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'gavocanov/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'

" Completion
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }

" Searching
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

" Syntax
Plug 'w0rp/ale'
Plug 'tmcw/vim-eslint-compiler'

" Initialize plugin system
call plug#end()

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
set belloff=all              " disable bell
set shiftwidth=2             " ident two
set laststatus=2             " always display status
set nocompatible             " make Vim more useful
set encoding=utf-8           " use utf-8 encoding
set wildignore+=node_modules " ignore node_modules

" performance: don't highlight beyond 400 columns
set synmaxcol=400

" style: show the 81th line
set colorcolumn=81

set nobackup
set noswapfile
set nowritebackup

" Appearance
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set statusline=%f%{fugitive#statusline()}
set background=dark
colorscheme hybrid
let g:hybrid_custom_term_colors = 1

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

" Keybindings
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nmap <leader>a :Ack

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
" set guifont=Fira\ Mono\ for\ Powerline

" Bbye
nnoremap <leader>q :Bdelete<CR>

" Comment on cmd-/
map <D-/> :Commentary<CR>
inoremap <D-/> <Esc>:Commentary<CR>==gi
vnoremap <D-/> :Commentary<CR>gv=gv

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
set completeopt-=preview

" vim-jsx
let g:jsx_ext_required = 0

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif

" Tern
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Flow
let g:flow#enable = 0
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
  let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
