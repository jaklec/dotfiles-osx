local api = vim.api
local g = vim.g
local opt = vim.opt

opt.encoding = "utf-8" -- ALWAYS!
opt.expandtab = true -- Use spaces for tabs!

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
g.mapleader = " "
g.maplocalleader = " "

opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true -- Set highlight on search
opt.number = true -- Make line numbers default
opt.relativenumber = true -- Make relative number default
opt.mouse = "a" -- Enable mouse mode
opt.ttyfast = true -- Fast scrolling
opt.breakindent = true -- Enable break indent
opt.undofile = true -- Save undo history
opt.ignorecase = true -- Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 -- Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.cursorline = true
opt.cursorcolumn = true
opt.hidden = true
opt.textwidth = 80
vim.wo.wrap = false
opt.sidescroll = 1
-- showbreak
opt.showmatch = true

opt.inccommand = "split" -- Use neovim live substitution
opt.timeoutlen = 300

-- Avoid "hit enter"-prompts
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

-- Filetype tweaks
vim.cmd [[
augroup filetype_tweaks
  autocmd!
  " Rust
  autocmd Filetype rust let termdebugger="rust-gdb"
  " Scala
  autocmd BufNewFile,BufRead *.sc set filetype=scala

  " Typescript
  autocmd BufNewFile,BufRead *.ts set filetype=typescript

  " Markdown
  autocmd BufNewFile,BufRead *.md set filetype=markdown

  " Use 4 spaces
  autocmd FileType rust,python,java,kotlin setlocal shiftwidth=4
  autocmd FileType python nmap <leader>d :term pudb3 %<cr>

  " Tab separated files (tsv)
  autocmd FileType tsv setlocal noexpandtab list listchars=tab:>- 

augroup END
]]

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

vim.cmd [[
  highlight LineNr guifg=#c5c5c5
  highlight Visual guibg=#55435b
]]

-- Use `rg` or `ag` instead of `grep`
vim.cmd [[
if executable('rg') 
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
elseif executable('ag')
  " Use smart case, match whole words, and output in vim-friendly format
  set grepprg=ag\ -S\ -Q\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif
]]
