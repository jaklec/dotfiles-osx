-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local default_opts = { noremap = true, silent = true }
local escape_opts = { noremap = true, silent = true, desc = "<esc>" }

vim.keymap.set("i", "<c-j>", "<esc>", escape_opts)
vim.keymap.set("s", "<c-j>", "<esc>", escape_opts)
vim.keymap.set("x", "<c-j>", "<esc>", escape_opts)
vim.keymap.set("c", "<c-j>", "<esc>", escape_opts)
vim.keymap.set("o", "<c-j>", "<esc>", escape_opts)
vim.keymap.set("l", "<c-j>", "<esc>", escape_opts)
vim.keymap.set("v", "<c-j>", "<esc>", escape_opts)
vim.keymap.set("t", "<c-j>", "<esc>", escape_opts)

-- Center search results
vim.keymap.set("n", "n", "nzz", default_opts)
vim.keymap.set("n", "N", "Nzz", default_opts)

-- Better indent
vim.keymap.set("v", "<", "<gv", default_opts)
vim.keymap.set("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dP"', default_opts)

-- Cancel search higlighting with ESC
vim.keymap.set("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Jump to last position on line and continue editing
vim.keymap.set("i", "<c-l>", "<ESC>A", default_opts)

vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", default_opts)
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Spell check
vim.keymap.set(
  "n",
  "<leader>xs",
  require("telescope.builtin").spell_suggest,
  { noremap = true, silent = true, desc = "Spell Suggestions" }
)

-- Navbuddy
vim.keymap.set(
  "n",
  "<leader>cn",
  require("nvim-navbuddy").open,
  { noremap = true, silent = true, desc = "Code Navigation" }
)

-- Close all other buffers
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<cr>", { noremap = true, silent = true, desc = "Close other buffers" })

-- Codeium
vim.keymap.set("i", "<c-cr>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })
vim.keymap.set("i", "<c-,>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })
vim.keymap.set("i", "<c-;>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })
vim.keymap.set("i", "<c-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true })
vim.keymap.set("i", "<C-s>", function()
  return vim.fn["codeium#Complete"]()
end, { expr = true })

-- OpenAI
vim.keymap.set(
  "n",
  "<leader>cc",
  require("chatgpt").edit_with_instructions,
  { noremap = true, silent = true, desc = "Edit with OpenAI" }
)

-- DAP
-- vim.keymap.set(
--   "n",
--   "<leader>db",
--   require("dap").toggle_breakpoint,
--   { noremap = true, silent = true, desc = "Toggle Breakpoint" }
-- )
-- vim.keymap.set("n", "<leader>dc", require("dap").continue, { noremap = true, silent = true, desc = "Continue" })
-- vim.keymap.set("n", "<leader>dr", require("dap").repl.open, { noremap = true, silent = true, desc = "Open REPL" })
-- vim.keymap.set("n", "<leader>do", require("dap").step_over, { noremap = true, silent = true, desc = "Step Over" })
-- vim.keymap.set("n", "<leader>di", require("dap").step_into, { noremap = true, silent = true, desc = "Step Into" })
-- vim.keymap.set("n", "<leader>dj", require("dap").step_out, { noremap = true, silent = true, desc = "Step Out" })
-- vim.keymap.set("n", "<leader>dl", require("dap").run_last, { noremap = true, silent = true, desc = "Run Last" })
-- vim.keymap.set("n", "<leader>ds", require("dap").terminate, { noremap = true, silent = true, desc = "Terminate" })
