local M = {}

local remap = vim.api.nvim_set_keymap
local npairs = require "nvim-autopairs"

_G.MUtils = {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({'selected'}).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', {expr = true, noremap = true})

function M.setup()
  local npairs = require "nvim-autopairs"
  npairs.setup {check_ts = true}
  npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
end

return M
