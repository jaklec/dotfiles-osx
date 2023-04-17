local M = {}

function M.setup()
  vim.keymap.set("i", "<c-cr>",
                 function() return vim.fn['codeium#Accept']() end, {expr = true})
  vim.keymap.set("i", "<c-,>",
                 function() return vim.fn['codeium#CycleCompletions'](1) end,
                 {expr = true})
  vim.keymap.set("i", "<c-;>",
                 function() return vim.fn['codeium#CycleCompletions'](-1) end,
                 {expr = true})
  vim.keymap.set("i", "<c-x>", function() return vim.fn['codeium#Clear']() end,
                 {expr = true})
  vim.keymap.set("i", "<C-s>",
                 function() return vim.fn['codeium#Complete']() end,
                 {expr = true})

end

return M
