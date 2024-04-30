return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "jmbuhr/otter.nvim",
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          LazyVim.lsp.on_attach(function(client)
            if client.name == "copilot" then
              copilot_cmp._on_insert_enter({})
            end
          end)
        end,
      },
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      cmp.setup({
        window = {
          completion = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal",
          },
          documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpDocNormal",
          },
        },
        sources = {
          { name = "nvim_lsp", priority = 8, group_index = 2 },
          { name = "copilot", priority = 7, group_index = 2 },
          { name = "buffer", priority = 6, group_index = 2 },
          { name = "luasnip", priority = 5, group_index = 2 },
          { name = "path", priority = 4, group_index = 2 },
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
      })

      opts.mapping = cmp.mapping.preset.insert({
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        -- ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        -- ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- ["<C-e>"] = cmp.mapping({
        --   i = cmp.mapping.abort(),
        --   c = cmp.mapping.close(),
        -- }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      })

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "otter" } }))
    end,
  },
}
