"map <C-p> :GFiles<CR>

" Py utils
"au FileType python map <silent> <leader>b Obreakpoint()<esc>

" Black
"autocmd BufWritePre *.py silent! execute ':Black'
"let g:black_linelength = 120

"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Dockerfile 
"autocmd BufEnter Dockerfile* silent! execute ':set syntax=dockerfile' 


source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/paths.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/nert-commenter.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/onedark.vim
