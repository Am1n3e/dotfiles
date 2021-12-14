local opt = vim.opt
local g = vim.g


opt.title = true
opt.clipboard = "unnamedplus" 
opt.cmdheight = 1 
opt.cul = true -- cursor line

-- Indentline
opt.expandtab = true 
opt.tabstop = 4 
opt.shiftwidth = 4 
opt.softtabstop = 4
opt.smartindent = true 
opt.autoindent = true

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = { eob = " " }

opt.hidden = true 
opt.ignorecase = true
opt.mouse = "a" 

-- Numbers
opt.number = true 
opt.relativenumber = true 
opt.numberwidth = 2 
opt.ruler = false 

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400 
opt.undofile = true 

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250 

vim.api.nvim_command("set noswapfile")


-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>hl"

g.mapleader = " " 


g.python3_host_prog = "/usr/local/bin/nvim_python"

vim.cmd 'colorscheme nightfox'
-- vim.g.material_style = "deep ocean"
-- Coq
vim.g.coq_settings = {
  auto_start = 'shut-up',
 keymap = {jump_to_mark= '<c-p>'}
}

-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }

vim.api.nvim_exec(
  [[
" Setting FileType:
augroup ensureFileType
  " Make sure all markdown files have the correct filetype set
  au BufRead,BufNewFile *.{md,md.erb,markdown,mdown,mkd,mkdn,txt} set filetype=markdown
  au BufNewFile,BufRead .flake8 set filetype=ini
  au BufNewFile,BufRead cronfile set filetype=sh
  au BufNewFile,BufRead *.{sh,txt,env*,flaskenv} set filetype=sh
  au BufNewFile,BufRead *aliases set filetype=zsh
  au BufNewFile,BufRead *.nix set filetype=nix
  au BufNewFile,BufRead .gitconfig set filetype=conf
  au BufNewFile,BufRead *.conf set filetype=config
  au BufNewFile,BufRead *.{kubeconfig,yml,yaml} set filetype=yaml syntax=on
augroup end
" Generic:
augroup generic
  au Filetype gitcommit setlocal spell textwidth=72
  au FileType git setlocal foldlevel=20  " open all unfolded
  au Filetype vim setlocal tabstop=2 foldmethod=marker
  au FileType *.ya?ml setlocal shiftwidth=2 tabstop=2 softtabstop=2
  au FileType sh,zsh setlocal foldmethod=marker foldlevel=10
  au FileType markdown setlocal wrap wrapmargin=2 textwidth=140 spell
  au FileType lua setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
augroup end

augroup python
  au FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=100
  au FileType python setlocal foldenable foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
augroup end
" Frontend:
augroup frontend
  " HTML
  autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
  autocmd FileType html setlocal foldmethod=syntax nowrap foldlevel=4
  " JSON
  autocmd FileType json setlocal foldmethod=syntax foldlevel=20
  " JS / TS / Vue
  autocmd FileType vue,typescript setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
augroup end
]],
  false
)

