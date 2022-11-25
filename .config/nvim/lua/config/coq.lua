local M = {}

function M.setup()
  local coq = require "coq"
  coq.Now()

  require "coq_3p" {
    {src = "nvimlua", short_name = "nLUA", conf_only = false}, -- Lua
    {src = "bc", short_name = "MATH", precision = 6}, -- Calculator
    {src = "vim_dadbod_completion", short_name = "DB"}
  }

end

return M
