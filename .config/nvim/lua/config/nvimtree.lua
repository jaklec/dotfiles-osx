local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      adaptive_size = true,
      centralize_selection = true,
      width = 30,
      number = true,
      relativenumber = true
    },
    filters = {custom = {".git"}},
    update_cwd = true,
    update_focused_file = {enable = true, update_cwd = true}
  }
end

return M
