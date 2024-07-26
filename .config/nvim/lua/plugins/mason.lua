return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "stylua")
      table.insert(opts.ensure_installed, "shellcheck")
      table.insert(opts.ensure_installed, "shfmt")
      table.insert(opts.ensure_installed, "prettierd")
    end,
  },
}
