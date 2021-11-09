vim.opt.list = true
vim.opt.listchars:append("eol:↴")

 require("indent_blankline").setup {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
       "help",
       "terminal",
       "dashboard",
       "packer",
       "lspinfo",
       "TelescopePrompt",
       "TelescopeResults",
    },
    buftype_exclude = { "terminal" },
    -- show_trailing_blankline_indent = false,
    -- show_first_indent_level = false,
    show_end_of_line = true,
 }
