local M = {}

function M.setup()
  local util = require "formatter.util"

  require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.INFO,
    filetype = {
      typescript = {
        function()
          return {
            exe = "prettierd", -- yay -S prettierd
            args = {util.escape_path(util.get_current_buffer_file_path())},
            stdin = true
          }
        end
      },
      javascript = {
        function()
          local cwd = util.escape_path(util.get_cwd())
          if string.find(cwd, 'images-backend', 1, true) then
            print("formatting" .. cwd)
            return {
              exe = "eslint",
              args = {
                "-c", "../lint/.eslintrc.js", "--fix",
                util.escape_path(util.get_current_buffer_file_path())
              },
              stdin = true
            }
          else
            print(util.escape_path(util.get_current_buffer_file_path()))
            return {
              exe = "prettierd",
              args = {util.escape_path(util.get_current_buffer_file_path())},
              stdin = true
            }
          end
        end
      },
      json = {
        function()
          return {
            exe = "prettierd",
            args = {util.escape_path(util.get_current_buffer_file_path())},
            stdin = true
          }
        end
      },
      lua = {
        function()
          return {
            exe = "lua-format", -- yay -S lua-format
            args = {
              util.escape_path(util.get_current_buffer_file_path()),
              '--indent-width=2'
            },
            stdin = true
          }
        end
      },
      rust = {
        function()
          return {
            exe = "rustfmt", -- yay -S lua-format
            args = {'--emit=stdout'},
            stdin = true
          }
        end
      }
    }
  })
end

-- Format on save
vim.cmd([[
augroup FormatAutogroup
	autocmd!
	autocmd BufWritePost *.ts,*.json,*.js,*.mjs,*.lua,*.rs silent! FormatWriteLock
augroup END
]], true)

return M
