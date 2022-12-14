local M = {}

local on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Actions
  map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk')
  map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk')
  map('n', '<leader>hS', gs.stage_buffer)
  map('n', '<leader>hu', gs.undo_stage_hunk)
  map('n', '<leader>hR', gs.reset_buffer)
  map('n', '<leader>hp', gs.preview_hunk)
  map('n', '<leader>hb', function() gs.blame_line {full = true} end)
  map('n', '<leader>hd', gs.diffthis)
  map('n', '<leader>hD', function() gs.diffthis('~') end)

  -- Text object
  map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

function M.setup() require('gitsigns').setup {on_attach = on_attach} end

return M
