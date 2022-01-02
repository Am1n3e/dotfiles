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
    -- use 'bluz71/vim-moonfly-colors'
   -- use 'marko-cerovac/material.nvim'
   use {
       'EdenEast/nightfox.nvim',
   }

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
             -- options = {
             --     theme = 'material-nvim',
             --     section_separators = { left = ' ', right = ' '},
             --     component_separators = { left = ' ', right = ' '}
             -- }
                options = {
                    -- theme = "vscode",
                    theme = "nightfox",
                    -- theme = "material-nvim",
                    component_separators = {'', ''},
                    section_separators = {'', ''},
                  },
                  sections = {
                    lualine_a = {{'filename', path = 2}},
                    lualine_b = {'branch', {
                      'diff',
                      -- color_added = 'green',
                      -- color_modified = 'yellow',
                      -- color_removed = 'red'
                    }},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                  },
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
      "nvim-treesitter/nvim-treesitter",
   }

   use "nvim-treesitter/playground"

   use {
       "nvim-treesitter/nvim-treesitter-textobjects",
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

   

   -- Completion
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "ray-x/cmp-treesitter" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-cmdline" },
        { "onsails/lspkind-nvim"},
      },
      config = override_req("nvim-cmp", "plugins.configs.cmp")
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

  -- use {
  --    "windwp/nvim-autopairs",
  --    config = override_req("nvim_autopairs", "plugins.configs.autopairs"),
  -- }

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
         {"nvim-telescope/telescope-vimspector.nvim"},
         {"dhruvmanila/telescope-bookmarks.nvim"},
         {
          "AckslD/nvim-neoclip.lua",
          config = function()
            require('neoclip').setup()
          end,
        },
        {"jvgrootveld/telescope-zoxide"},
        {"cljoly/telescope-repo.nvim"}


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

   -- use {
   --   'puremourning/vimspector',
   --   setup = function()
   --     require("mappings").vimspector()
   --   end
   -- }
   use {
       'mfussenegger/nvim-dap',
         setup = function()
           require("mappings").nvim_dap()
         end
   }

   use {
     'mfussenegger/nvim-dap-python',
      config = function()
        require('dap-python').setup("python")
        require('dap.ext.vscode').load_launchjs()
     end,
     requires = {
       'mfussenegger/nvim-dap',
     }
 }

   use 'ggandor/lightspeed.nvim'

   use "Pocco81/TrueZen.nvim"

   -- use 'christoomey/vim-tmux-navigator'

   use {"numToStr/FTerm.nvim",
        setup = function()
       require("mappings").fterm()
     end
    }

   use {
       "tpope/vim-fugitive"
   }

   use {
       "knubie/vim-kitty-navigator",
       run = "cp ./*.py ~/.config/kitty/"
   }
use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end 
}


 end)
