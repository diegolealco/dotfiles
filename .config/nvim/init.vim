let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:ale_completion_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_fixers = {
            \   'javascript': ['prettier', 'eslint'],
            \   'javascriptreact': ['prettier', 'eslint'],
            \   'typescript': ['prettier', 'eslint'],
            \   'typescriptreact': ['prettier', 'eslint'],
            \   'vue': ['prettier', 'eslint']
            \}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = "--loglevel silent"
let g:fzf_preview_window = []
let g:windowswap_map_keys = 0
let g:gitgutter_map_keys = 0
let g:test#strategy = "neovim"
let g:test#echo_command = 0

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'moll/vim-bbye'
Plug 'nanotech/jellybeans.vim'
Plug 'justinmk/vim-dirvish'
Plug 'sheerun/vim-polyglot'
Plug 'sirver/ultisnips'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'wesQ3/vim-windowswap'
Plug 'vim-test/vim-test'
call plug#end()

set clipboard^=unnamedplus,unnamed
set completeopt=menu,menuone,preview,noselect,noinsert
set omnifunc=ale#completion#OmniFunc
set confirm
set hidden
set mouse=a
set number
set scrolloff=8
set title
set shortmess=xtI
set splitbelow
set splitright
set fileformats=unix,dos,mac
set winwidth=80

set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=8

set list
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set showbreak=↪\ 
set breakindent
set linebreak

set ignorecase
set smartcase

set undofile
set undolevels=1000

if (empty($TMUX) && !has("termguicolors"))
    set termguicolors
endif

set t_Co=256
set t_ut=
colorscheme jellybeans
set background=dark

set wildcharm=<C-z>
set wildignorecase
set wildmode=list:full
set wildignore=*/node_modules/*,*/bower_components/*,*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*,*.jpg,*.png,*.bmp,*.gif,*.ico,*.pdf,*.psd,*.swp,*.bak,*.tar.*,*.zip,*.so,*.pyc,*.sln,*.Master,*.csproj,*.csproj.user,*.exe,*.dll,*.pdb,*.min.*,*.cache,*.class

augroup recursive_mkdir_on_save
    autocmd!
    autocmd BufWritePre * if !isdirectory(expand("<afile>:p:h")) | call mkdir(expand("<afile>:p:h"), "p") | endif
augroup END

augroup fix_tsx_syntax
    autocmd!
    autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
    autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
augroup END

augroup cd_on_startup
    autocmd!
    autocmd VimEnter * if isdirectory(expand('%')) | cd % | endif
augroup END

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap 0 g^
nnoremap $ g_
vnoremap 0 g^
vnoremap $ g_

cnoremap WQ wq
cnoremap Wq wq

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <F1> <Nop>
vnoremap <F1> <Nop>
inoremap <F1> <Nop>
nnoremap Q <Nop>
nnoremap K <Nop>

inoremap <C-o> <C-x><C-o>
inoremap <C-f> <C-x><C-f>
inoremap <C-t> <C-x><C-]>

nnoremap vv ^vg_
cnoremap bd Bdelete
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap [h :GitGutterPrevHunk<CR>

tnoremap <C-o> <C-\><C-n>

nnoremap <Space>t :TestNearest<CR>
nnoremap <Space>a :ALEFix<CR>
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>f :Files<CR>
nnoremap <Space>l :nohlsearch<C-r>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>
nnoremap <Space>s :%s///gc<Left><Left><Left>
nnoremap <Space>w :call WindowSwap#EasyWindowSwap()<CR>

command! EditVimrc edit $MYVIMRC
command! SourceVimrc source $MYVIMRC

