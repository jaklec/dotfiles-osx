local M = {}

function M.setup()
  require"lsp_signature".setup({max_height = 3, toggle_key = "<C-s>"})
end

return M
