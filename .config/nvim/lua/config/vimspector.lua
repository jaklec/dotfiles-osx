local M = {}

local utils = require "utils"

local vimspector_python = [[
{
  "configurations": {
    "<name>: Launch": {
      "adapter": "debugpy",
      "configuration": {
        "name": "Python: Launch",
        "type": "python",
        "request": "launch",
        "python": "%s",
        "stopOnEntry": true,
        "console": "externalTerminal",
        "debugOptions": [],
        "program": "${file}"
      }
    }
  }
}
]]

local vimspector_javascript = [[
{
  "configurations": {
    "<name>: Launch": {
      "adapter": "vscode-node",
      "configuration": {
        "name": "node debugger",
        "type": "node",
        "request": "launch",
        "stopOnEntry": true,
        "console": "integratedTerminal",
        "program": "${file}"
      }
    }
  }
}
]]

local vimspector_rust = [[
{
  "configurations": {
    "<name>: Launch": {
      "adapter": "CodeLLDB",
      "configuration": {
        "name": "rust debugger",
        "type": "rust",
        "request": "launch",
        "stopOnEntry": true,
        "console": "integratedTerminal",
        "program": "${file}"
      }
    }
  }
}
]]

local function debuggers()
  vim.g.vimspector_install_gadgets = {
    "debugpy", -- python
    "vscode-node-debug2", -- javascript/typescript
    "CodeLLDB" -- Rust/C++
  }
end

-- Generate debug profile.
function M.generate_debug_profile()
  -- Get current file type
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")

  if ft == "python" then
    local python3 = vim.fn.exepath "python3" or vim.fn.exepath "python"
    local debugProfile = string.format(vimspector_python, python3)

    -- Generate debug profile in a new window
    vim.api.nvim_exec("vsp", true)
    local win = vim.api.nvim_get_current_win()
    local bufNew = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_name(bufNew, ".vimspector.json")
    vim.api.nvim_win_set_buf(win, bufNew)

    local lines = {}
    for s in debugProfile:gmatch "[^\r\n]+" do table.insert(lines, s) end
    vim.api.nvim_buf_set_lines(bufNew, 0, -1, false, lines)

  elseif ft == "javascript" then
    -- Generate debug profile in a new window
    vim.api.nvim_exec("vsp", true)
    local win = vim.api.nvim_get_current_win()
    local bufNew = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_name(bufNew, ".vimspector.json")
    vim.api.nvim_win_set_buf(win, bufNew)

    local lines = {}
    for s in vimspector_javascript:gmatch "[^\r\n]+" do
      table.insert(lines, s)
    end
    vim.api.nvim_buf_set_lines(bufNew, 0, -1, false, lines)

  elseif ft == "rust" then
    -- Generate debug profile in a new window
    vim.api.nvim_exec("vsp", true)
    local win = vim.api.nvim_get_current_win()
    local bufNew = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_name(bufNew, ".vimspector.json")
    vim.api.nvim_win_set_buf(win, bufNew)

    local lines = {}
    for s in vimspector_rust:gmatch "[^\r\n]+" do table.insert(lines, s) end
    vim.api.nvim_buf_set_lines(bufNew, 0, -1, false, lines)

  else
    utils.info("Unsupported language - " .. ft, "Generate Debug Profile")
  end
end

function M.toggle_human_mode()
  if vim.g.vimspector_enable_mappings == nil then
    vim.g.vimspector_enable_mappings = "HUMAN"
    utils.info("Enabled HUMAN mappings", "Debug")
  else
    vim.g.vimspector_enable_mappings = nil
    utils.info("Disabled HUMAN mappings", "Debug")
  end
end

function M.setup()
  vim.cmd [[packadd! vimspector]] -- Loac vimspector
  debuggers() -- Configure debuggers
end

return M
