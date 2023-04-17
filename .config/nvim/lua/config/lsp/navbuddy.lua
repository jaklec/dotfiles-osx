local M = {}

local navbuddy = require("nvim-navbuddy")

function M.setup(client, bufnr) navbuddy.attach(client, bufnr) end

return M

