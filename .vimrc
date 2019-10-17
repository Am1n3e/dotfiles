set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'singularityware/singularity.lang', {'rtp': 'vim/'}
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'takac/vim-hardtime'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...
"
let mapleader = ","

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Split layout
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Python Indentation/Pep8
au BufNewFile,BufRead *.py |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" AutoComplete
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Flake8
autocmd BufWritePost *.py call flake8#Flake8()
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=0

" Nerd tree
let NERDTreeIgnore=['\.pyc$', '\~$']
map <C-n> :NERDTreeToggle<CR>

" Fzf 
map <C-p> :GFiles<CR>

" Nerd commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

map - <Leader>c<Space>

set rnu " Set relative line number
set noswapfile

:nmap <space> :
:imap <C-j> <Down>
:imap <C-k> <Up>

com! Fjson %!python3 -m json.tool

set laststatus=2

set guifont=Source\ Code\ Pro\ for\ Powerline:h13 

let g:ycm_python_binary_path = 'python' 

let python_highlight_all=1

" let g:hardtime_default_on = 1
let g:hardtime_ignore_quickfix = 1

autocmd Filetype Jenkinsfile setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 expandtab

if &diff
	highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif 

set backspace=indent,start

" Pytest
map <Leader>t  :VimuxRunCommand("pytest -v")<CR>
map <Leader>tc :VimuxRunCommand("pytest -v " . bufname("%"))<CR>

" PDB
nnoremap <Leader>b Oimport pdb; pdb.set_trace()<Esc>

syntax on
