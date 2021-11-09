local g = vim.g


vim.cmd([[
augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END
]])

g.neoformat_run_all_formatters = 1
g.neoformat_enabled_python = {'black', 'isort', 'docformatter' }
g.neoformat_python_black = {
    exe = "black",
    stdin = 1,
    args = {"-q", "-"}
}
