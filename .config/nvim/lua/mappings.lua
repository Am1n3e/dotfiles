local utils = require "utils"
local hooks = require "hooks"

local cmd = vim.cmd
local map = utils.map

local M = {}

M.telescope = function()

   map("n", "<leader>ff", ":Telescope find_files <CR>")
   map("n", "<leader>fa", ":Telescope find_files hidden=true <CR>")
   map("n", "<leader>fr", ":Telescope oldfiles <CR>")

   map("n", "<leader>gm", ":Telescope git_commits <CR>")
   map("n", "<leader>gb", ":Telescope git_bcommits <CR>")
   map("n", "<leader>gs", ":Telescope git_status <CR>")
   map("n", "<leader>gt", ":Telescope git_stash <CR>")

   map("n", "<leader>s", "[[<Cmd>lua require'plugins.configs.telescope_utils'.grep_prompt()<CR>]]")
   map("n", "<leader>ss", ":Telescope live_grep <CR>")
   map("n", "<leader>sb", ":Telescope current_buffer_fuzzy_find <CR>")

   map("n", "<leader>bb", ":Telescope buffers <CR>")

   map("n", ";c", "[[<Cmd>lua require'plugins.configs.telescope_utils'.vimspector_configs()<CR>]]")

   map("n", "<leader>j", ":Telescope jumplist <CR>")
   map("n", "<leader>c", ":Telescope command_history <CR>")

   map("n", "<leader>ds", ":Telescope lsp_document_symbols <CR>")
   map("n", "<leader>a", ":Telescope lsp_code_actions <CR>")
   map("n", "<leader>dd", ":Telescope lsp_document_diagnostics <CR>")
   map("n", "<leader>m", ":Telescope marks <CR>")

   map("n", "<space>e", [[<Cmd>lua require'plugins.configs.telescope_utils'.find_configs()<CR>]], { noremap = true, silent = true })

   map(
      "n",
      "<space>b",
      [[<Cmd>lua require('telescope').extensions.bookmarks.bookmarks()<CR>]],
      { noremap = true, silent = true }
   )
   map(
      "n",
      "<space>n",
      [[<Cmd>lua require('telescope').extensions.neoclip.plus()<CR>]],
      { noremap = true, silent = true }
   )
   map(
      "n",
      "<leader>z",
      ":lua require'telescope'.extensions.zoxide.list{results_title='Z Directories', prompt_title='Z Prompt'}<CR>",
      { noremap = true, silent = true }
    )
    map("n", "<leader>r", [[<Cmd>lua require'telescope'.extensions.repo.list{}<CR>]], { noremap = true, silent = true })


end

M.comment = function()
   map("n", "<leader>/", ":CommentToggle <CR>")
   map("v", "<leader>/", ":CommentToggle <CR>")
end

M.nvimtree = function()
   map("n", "<C-n>", ":NvimTreeToggle <CR>")
   map("n", "<leader>e", ":NvimTreeFocus <CR>")
end

M.neoformat = function()
   map("n", "<leader>fn", ":Neoformat <CR>")
end

M.bufferline = function()
   map("n", "<TAB>", ":BufferLineCycleNext <CR>")
   map("n", "<S-TAB>", ":BufferLineCyclePrev <CR>")
end

M.vimspector = function()
  vim.g.vimspector_enable_mappings = 'HUMAN'
  -- map("n", ";d", ":call vimspector#Launch()<CR>")
  -- map("n", ";r", ":VimspectorReset<CR>")
end

M.nvim_dap = function()
  map("n", ";b", ":lua require'dap'.toggle_breakpoint()<CR>")
  map("n", ";d", ":lua require'dap'.continue()<CR>")
  map("n", ";s", ":lua require'dap'.step_over()<CR>")
  map("n", ";i", ":lua require'dap'.step_into()<CR>")
  map("n", ";p", ":lua require'dap'.repl.open()<CR>")
  map("n", ";h", ":lua require('dap.ui.widgets').hover()<CR>")
end


M.fterm = function()
    map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
    map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
end


M.misc = function()
  -- Don't copy the replaced text after pasting in visual mode
  map("v", "p", '"_dP')
  -- don't yank text on cut ( x )
  map({ "n", "v" }, "x", '"_x')

  -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
  -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
  -- empty mode is same as using :map
  -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
  map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
  map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

  -- use ESC to turn off search highlighting
  map("n", "<Esc>", ":noh <CR>")

  map("i", "<C-c>", "<Esc>")

  -- navigation within insert mode
  map("i", "<C-h>", "<Left>")
  map("i", "<C-e>", "<End>")
  map("i", "<C-l>", "<Right>")
  -- map("i", "<C-k>", "<Up>")
  -- map("i", "<C-j>", "<Down>")
  map("i", "<C-a>", "<ESC>^i")

  -- easier navigation between windows

  map("n", "<C-h>", "<C-w>h")
  map("n", "<C-l>", "<C-w>l")
  map("n", "<C-k>", "<C-w>k")
  map("n", "<C-j>", "<C-w>j")


  map("n", "<leader>x", ":lua require('utils').close_buffer() <CR>") -- close  buffer
  map("n", "<C-a>", ":%y+ <CR>") -- copy whole file content
  map("n", "<S-t>", ":enew <CR>") -- new buffer
  map("n", "<C-s>", ":w <CR>") -- ctrl + s to save file

  map("v", "<", "<gv")
  map("v", ">", ">gv")

  map("n", ";g", ":G<CR>")

  -- Replace word under cursor in Buffer (case-sensitive)
  map("n", ";sb", ":%s/<C-R><C-W>//gI<left><left><left>", { noremap = false })

  -- Replace word under cursor on Line (case-sensitive)
  map("n", ";sl", ":s/<C-R><C-W>//gI<left><left><left>", { noremap = false })


  -- Add Packer commands because we are not loading it at startup
  cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
  cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
  cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
  cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
  cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
  cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"



  hooks.run("setup_mappings", map)
end

-- below are all plugin related mappings

-- 
-- 
-- M.dashboard = function()
  --    local m = plugin_maps.dashboard
  -- 
  --    map("n", m.bookmarks, ":DashboardJumpMarks <CR>")
  --    map("n", m.new_file, ":DashboardNewFile <CR>")
  --    map("n", m.open, ":Dashboard <CR>")
  --    map("n", m.session_load, ":SessionLoad <CR>")
  --    map("n", m.session_save, ":SessionSave <CR>")
  -- end

return M
