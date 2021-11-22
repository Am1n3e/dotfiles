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

-- colorscheme
vim.cmd [[colorscheme moonfly]]
--
-- Coq
vim.g.coq_settings = {
  auto_start = 'shut-up',
 keymap = {jump_to_mark= '<c-p>'}
}

-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }

