local keymap = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local expr_opts = {noremap = true, expr = true, silent = true}

-- Better escape using jk in insert and terminal mode
keymap("i", "<c-j>", "<ESC>", default_opts)
keymap("s", "<c-j>", "<ESC>", default_opts)
keymap("x", "<c-j>", "<ESC>", default_opts)
keymap("c", "<c-j>", "<ESC>", default_opts)
keymap("o", "<c-j>", "<ESC>", default_opts)
keymap("l", "<c-j>", "<ESC>", default_opts)
keymap("v", "<c-j>", "<ESC>", default_opts)
keymap("t", "<c-j>", "<C-\\><C-n>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)

keymap("n", "<leader><leader>", "<c-^>", default_opts) -- toggle between buffers

keymap("i", "<C-l>", "<ESC>A", default_opts) -- jump to last position on line and continue editing

keymap("n", "H", "^", default_opts)
keymap("n", "L", "$", default_opts)
