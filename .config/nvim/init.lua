-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("text.abbreviations").setup()

vim.cmd([[
  highlight LineNr guifg=#c5c5c5
  highlight Visual guibg=#55435b
  highlight CursorLineNr guifg=orange
]])

vim.lsp.set_log_level("error")

-- vim.cmd("autocmd BufRead,BufNewFile *.qmd set filetype=markdown")
