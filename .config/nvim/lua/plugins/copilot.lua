return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}
-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "InsertEnter",
--     build = ":Copilot auth",
--     opts = {
--       suggestion = {
--         enabled = false,
--         --   auto_trigger = false,
--         --   keymap = {
--         --     accept_word = false,
--         --     accept_line = false,
--         --   },
--       },
--       panel = { enabled = false },
--       -- filetypes = {
--       --   markdown = true,
--       --   help = true,
--       -- },
--     },
--   },
--   {
--     "zbirenbaum/copilot-cmp",
--     config = function(_, opts)
--       -- require("copilot_cmp").setup()
--       local copilot_cmp = require("copilot_cmp")
--       copilot_cmp.setup(opts)
--       -- attach cmp source whenever copilot attaches
--       -- fixes lazy-loading issues with the copilot cmp source
--       LazyVim.lsp.on_attach(function(client)
--         if client.name == "copilot" then
--           copilot_cmp._on_insert_enter({})
--         end
--       end)
--     end,
--   },
-- }
