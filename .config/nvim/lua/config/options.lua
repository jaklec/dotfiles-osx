-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.ttyfast = true
opt.breakindent = true
opt.cursorline = true
opt.cursorcolumn = true
opt.hidden = true
opt.textwidth = 80
opt.sidescroll = 1
opt.showmatch = true
opt.inccommand = "split"
opt.shortmess = "o"

-- Folds
-- zf: create new fold
-- zc: close fold
-- zo: open fold
-- zd: delete fold
--
-- Example
-- f{v%zf: jump to '{' mark all until matching '}' and create fold
opt.foldcolumn = "2"

opt.synmaxcol = 500 -- Restric highting width for performance reasons

-- Don't scal included files for keyword completion (SLOW)
opt.complete = opt.complete - "i"

opt.formatoptions = opt.formatoptions + "n"
-- Do not auto wrap or continue comments on new line
opt.formatoptions.c = false
opt.formatoptions.r = false
opt.formatoptions.o = false

-- No pesky backups!
opt.backup = false
opt.swapfile = false
opt.writebackup = false

-- Use system clipboard
opt.clipboard = opt.clipboard + "unnamed"

-- Tab/indentation spaces width
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
