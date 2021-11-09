local M = {}
function M.grep_prompt()
    require("telescope.builtin").grep_string {
      path_display = { "shorten" },
      search = vim.fn.input "Rg > ",
      only_sort_text = true,
      use_regex = true,
  }
end

function M.vimspector_configs()
  require('telescope').extensions.vimspector.configurations()
end

function M.find_configs()
  require("telescope.builtin").find_files {
    prompt_title = " NVim & Term Config Find",
    results_title = "Config Files Results",
    path_display = { "shorten" },
    search_dirs = {
      "~/.config/nvim",
      "~/.config/alacritty",
    },
    cwd = "~/.config/nvim/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

return M
