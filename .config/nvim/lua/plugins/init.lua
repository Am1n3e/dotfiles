local present, packer = pcall(require, "plugins.packerInit")

if not present then
   return false
end

local use = packer.use

return packer.startup(function()

   local override_req = function(name, plugin_config)

      if string.match(plugin_config, "^%(") then
         plugin_config = plugin_config:sub(2)
         plugin_config = plugin_config:gsub("%)%.", "').", 1)
         return "require('" .. plugin_config
      else
         return "require('" .. plugin_config .. "')"
      end
   end

   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }


   -- Visual
    use 'bluz71/vim-moonfly-colors'

   use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup {
          default=true,
        }
      end
   }

   use {
     'nvim-lualine/lualine.nvim',
     requires = {'kyazdani42/nvim-web-devicons', opt = true},
     config = function()
         require("lualine").setup{
             options = {
                 theme = 'moonfly',
                 section_separators = { left = ' ', right = ' '},
                 component_separators = { left = ' ', right = ' '}
             }
         }
     end
   }

    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {}
      end
    }

    use { 
        "nvim-neorg/neorg",
        config = function()
        require('neorg').setup {
            -- Tell Neorg what modules to load
            load = {
                ["core.defaults"] = {}, -- Load all the default modules
                ["core.norg.concealer"] = {}, -- Allows for use of icons
                ["core.norg.dirman"] = { -- Manage your directories with Neorg
                    config = {
                        workspaces = {
                            my_workspace = "~/neorg"
                        }
                    }
                }
            },
        }
        end,
            -- config = override_req("neorg", "plugins.configs.neorg"),
        requires = "nvim-lua/plenary.nvim",
        after = "nvim-treesitter"
    }

   use {
      "akinsho/bufferline.nvim",
      after = "nvim-web-devicons",
     config = function()
       require('bufferline').setup{}
     end,
      setup = function()
         require("mappings").bufferline()
      end,
   }
   use {
      "nvim-treesitter/nvim-treesitter",
      branch = "0.5-compat",
      event = "BufRead",
      config = override_req("nvim_treesitter", "plugins.configs.treesitter"),
   }

   use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = override_req("indent_blankline", "plugins.configs.indent_blankline"),
   }

   -- git stuff
   use {
      "lewis6991/gitsigns.nvim",
      opt = true,
      config = override_req("gitsigns", "plugins.configs.gitsigns"),
      setup = function()
         require("utils").packer_lazy_load "gitsigns.nvim"
      end,
   }

   -- LSP 
   use {
      "neovim/nvim-lspconfig",
      opt = true,
      setup = function()
         require("utils").packer_lazy_load "nvim-lspconfig"
         -- reload the current file so lsp actually starts for it
         vim.defer_fn(function()
            vim.cmd "silent! e %"
         end, 0)
      end,
      config = override_req("lspconfig", "plugins.configs.lspconfig"),
   }
   use {
        'ms-jpq/coq_nvim',
        branch= 'coq',
        event = "VimEnter",
        config = 'vim.cmd[[COQnow]]'
    }

    use {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts',
        requires={'ms-jpq/coq_nvim'}
    }

    use {
        'ms-jpq/coq.thirdparty',
        branch= '3p',
        requires={'ms-jpq/coq_nvim'}
    }

   use {
      "andymass/vim-matchup",
      opt = true,
      setup = function()
         require("utils").packer_lazy_load "vim-matchup"
      end,
   }


   -- Editing
   use {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
      config = function()
        require("better_escape").setup {
          mapping = {"jj"},
          timeout = 300,
        }
      end
   }

   use {
      "terrortylor/nvim-comment",
      cmd = "CommentToggle",
      config = function()
        local present, nvim_comment = pcall(require, "nvim_comment")
        if present then
          nvim_comment.setup()
        end
      end,
      setup = function()
         require("mappings").comment()
      end,
   }

   use {
      "sbdchd/neoformat",
      cmd = "Neoformat",
      config = function()
          require("plugins.configs.neoformat")
      end, 
      setup = function()
         require("mappings").neoformat()
      end,
   }

  use {
     "windwp/nvim-autopairs",
     config = override_req("nvim_autopairs", "plugins.configs.autopairs"),
  }

   -- Misc
   use {
      "karb94/neoscroll.nvim",
      opt = true,
      config = function() pcall(function() require("neoscroll").setup() end) end,
      setup = function()
         require("utils").packer_lazy_load "neoscroll.nvim"
      end,
   }

   -- File management
   use {
      "nvim-lua/plenary.nvim",
   }

   use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      requires = {
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
         },
         {"nvim-lua/popup.nvim"},
         {"nvim-telescope/telescope-vimspector.nvim"}

      },

      config = override_req("telescope", "plugins.configs.telescope"),
      setup = function()
         require("mappings").telescope()
      end,
   }

   use {
      "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = override_req("nvim_tree", "plugins.configs.nvimtree"),
      setup = function()
         require("mappings").nvimtree()
      end,
   }

   use {
     'puremourning/vimspector',
     setup = function()
       require("mappings").vimspector()
     end
   }

   use 'ggandor/lightspeed.nvim'

   use "Pocco81/TrueZen.nvim"

 end)
