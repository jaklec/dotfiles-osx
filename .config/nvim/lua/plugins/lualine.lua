return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, function()
        return "-cp:" .. require("copilot.api").status.data.status
      end)
    end,
  },
}
