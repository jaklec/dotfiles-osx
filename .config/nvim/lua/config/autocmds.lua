-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Filetype tweaks
--
vim.cmd([[
augroup filetype_tweaks
  autocmd!

  " Use 4 spaces
  autocmd FileType rust,python,java,kotlin setlocal shiftwidth=4
  autocmd FileType python nmap <leader>d :term pudb3 %<cr>

  " Tab separated files (tsv)
  autocmd FileType tsv setlocal noexpandtab list listchars=tab:>- 

augroup END
]])

-- Use `rg` or `ag` instead of `grep`
vim.cmd([[
if executable('rg') 
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
elseif executable('ag')
  " Use smart case, match whole words, and output in vim-friendly format
  set grepprg=ag\ -S\ -Q\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif
]])
