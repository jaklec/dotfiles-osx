-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
vim.keymap.set("n", "<leader>ft", function()
  LazyVim.terminal.open(nil, { cwd = Util.root.get(), border = "rounded" })
end, { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<leader>fT", function()
  LazyVim.terminal.open(nil, { border = "rounded" })
end, { desc = "Terminal (cwd)" })

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
-- vim.keymap.set("i", "<c-cr>", function()
--   return vim.fn["codeium#Accept"]()
-- end, { expr = true })
-- vim.keymap.set("i", "<c-,>", function()
--   return vim.fn["codeium#CycleCompletions"](1)
-- end, { expr = true })
-- vim.keymap.set("i", "<c-;>", function()
--   return vim.fn["codeium#CycleCompletions"](-1)
-- end, { expr = true })
-- vim.keymap.set("i", "<c-x>", function()
--   return vim.fn["codeium#Clear"]()
-- end, { expr = true })
-- vim.keymap.set("i", "<C-s>", function()
--   return vim.fn["codeium#Complete"]()
-- end, { expr = true })

-- OpenAI
vim.keymap.set(
  "n",
  "<leader>Ce",
  require("chatgpt").edit_with_instructions,
  { noremap = true, silent = true, desc = "Edit with OpenAI" }
)
vim.keymap.set(
  "v",
  "<leader>Ce",
  require("chatgpt").edit_with_instructions,
  { noremap = true, silent = true, desc = "Edit with OpenAI" }
)
vim.keymap.set(
  "n",
  "<leader>Cd",
  "<cmd>ChatGPTRun docstring<cr>",
  { noremap = true, silent = true, desc = "Docstring" }
)
vim.keymap.set(
  "v",
  "<leader>Cd",
  "<cmd>ChatGPTRun docstring<cr>",
  { noremap = true, silent = true, desc = "Docstring" }
)
vim.keymap.set(
  "n",
  "<leader>Ca",
  "<cmd>ChatGPTRun add_tests<cr>",
  { noremap = true, silent = true, desc = "Add Tests" }
)
vim.keymap.set(
  "v",
  "<leader>Ca",
  "<cmd>ChatGPTRun add_tests<cr>",
  { noremap = true, silent = true, desc = "Add Tests" }
)
vim.keymap.set(
  "n",
  "<leader>Co",
  "<cmd>ChatGPTRun optimize_code<cr>",
  { noremap = true, silent = true, desc = "Optimize Code" }
)
vim.keymap.set(
  "v",
  "<leader>Co",
  "<cmd>ChatGPTRun optimize_code<cr>",
  { noremap = true, silent = true, desc = "Optimize Code" }
)
vim.keymap.set(
  "n",
  "<leader>Cx",
  "<cmd>ChatGPTRun explain_code<cr>",
  { noremap = true, silent = true, desc = "Explain Code" }
)
vim.keymap.set(
  "v",
  "<leader>Cx",
  "<cmd>ChatGPTRun explain_code<cr>",
  { noremap = true, silent = true, desc = "Explain Code" }
)
vim.keymap.set("n", "<leader>Cf", "<cmd>ChatGPTRun fix_bugs<cr>", { noremap = true, silent = true, desc = "Fix Bugs" })
vim.keymap.set("v", "<leader>Cf", "<cmd>ChatGPTRun fix_bugs<cr>", { noremap = true, silent = true, desc = "Fix Bugs" })
vim.keymap.set(
  "n",
  "<leader>Cl",
  "<cmd>ChatGPTRun code_readability_analysis<cr>",
  { noremap = true, silent = true, desc = "Code Readability Analysis" }
)
vim.keymap.set(
  "v",
  "<leader>Cl",
  "<cmd>ChatGPTRun code_readability_analysis<cr>",
  { noremap = true, silent = true, desc = "Code Readability Analysis" }
)
vim.keymap.set(
  "n",
  "<leader>Cs",
  "<cmd>ChatGPTRun summarize<cr>",
  { noremap = true, silent = true, desc = "Summarize" }
)
vim.keymap.set(
  "v",
  "<leader>Cs",
  "<cmd>ChatGPTRun summarize<cr>",
  { noremap = true, silent = true, desc = "Summarize" }
)
vim.keymap.set(
  "n",
  "<leader>Ct",
  "<cmd>ChatGPTRun translate<cr>",
  { noremap = true, silent = true, desc = "Translate" }
)
vim.keymap.set(
  "v",
  "<leader>Ct",
  "<cmd>ChatGPTRun translate<cr>",
  { noremap = true, silent = true, desc = "Translate" }
)
vim.keymap.set(
  "n",
  "<leader>Cg",
  "<cmd>ChatGPTRun grammar_correction<cr>",
  { noremap = true, silent = true, desc = "Grammar Correction" }
)
vim.keymap.set(
  "v",
  "<leader>Cg",
  "<cmd>ChatGPTRun grammar_correction<cr>",
  { noremap = true, silent = true, desc = "Grammar Correction" }
)
-- vim.keymap.set("n", "<leader>Cc", ":GpChatNew<cr>", { noremap = true, silent = true, desc = "New Chat" })
-- vim.keymap.set("n", "<leader>Ct", ":GpChatToggle<cr>", { noremap = true, silent = true, desc = "Toggle Popup Chat" })
-- vim.keymap.set("n", "<leader>Cf", ":GpChatFinder<cr>", { noremap = true, silent = true, desc = "Chat Finder" })
-- vim.keymap.set("v", "<leader>Cr", ":GpRewrite<cr>", { noremap = true, silent = true, desc = "Visual Rewrite" })
vim.keymap.set(
  "n",
  "<leader>gt",
  ":ToggleBlameLine<cr>",
  { noremap = true, silent = true, desc = "Toggle Git Blame at end of line" }
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
