-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("text.abbreviations").setup()

vim.lsp.set_log_level("error")
