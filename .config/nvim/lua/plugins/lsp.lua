return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = {
          lsp = { auto_attach = true },
          -- servers = {
          --   eslint = {
          --     settings = {
          --       experimental = {
          --         useFlatConfig = true,
          --       },
          --       -- workingDirectory = {
          --       --   mode = "auto",
          --       -- },
          --     },
          --   },
          -- },
          setup = {
            eslint = function()
              vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function(event)
                  if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
                    vim.cmd("EslintFixAll")
                  end
                end,
              })
            end,
          },
        },
      },
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        rust_analyzer = {},
        jsonls = {},
        vimls = {},
        html = {},
        gopls = {},
        svelte = {},
        volar = {},
        tailwindcss = {},
        terraformls = {},
        cmake = {},
      },
    },
  },
}
