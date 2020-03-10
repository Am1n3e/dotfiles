" the relevant modules (add to plug-section if you already have one)
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'wsdjeg/FlyGrep.vim'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'crusoexia/vim-monokai'
call plug#end()

filetype indent on
set encoding=UTF-8
set fileformat=unix
set shortmess+=c
set relativenumber
set hlsearch  " highlight search and search while typing
set incsearch
set cpoptions+=x  " stay at seach item when <esc>
set expandtab
set tabstop=4
set shiftwidth=4
set fillchars+=vert:\  " remove chars from seperators
set softtabstop=4
set splitright  " i prefer splitting right and below
set splitbelow
set laststatus=2  " always slow statusline
set nobackup  " no backup or swap file, live dangerously
set noswapfile  " swap files give annoying warning
highlight VertSplit ctermbg=253
set termguicolors
colorscheme monokai
" Status line
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
"
" ncm2
let g:python3_host_prog = '/usr/local/bin/python3'
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" let g:ncm2#matcher = 'substrfuzzy'

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader = ","
:nmap <space> :
:imap <C-j> <Down>
:imap <C-k> <Up>
map - <leader>c<Space>

" jedi options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = 0 
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = ''  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0

" Nerd tree
let NERDTreeIgnore=['\.pyc$', '\~$']
map <C-n> :NERDTreeToggle<CR>
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>

map <C-p> :GFiles<CR>

" vimgutter options
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0
" Ale
"let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
let g:ale_list_window_size = 4
let g:ale_sign_column_always = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = '0'
let g:ale_sign_error = '‼'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = '0'
let g:ale_lint_on_save = '1'

" Py utils
au FileType python map <silent> <leader>b Ofrom pdb import set_trace; set_trace()<esc>
