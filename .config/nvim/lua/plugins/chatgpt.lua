--When using ChatGPT and ChatGPTEditWithInstructions, the following keybindings are available:
--     <C-Enter> [Both] to submit.
--     <C-y> [Both] to copy/yank last answer.
--     <C-o> [Both] Toggle settings window.
--     <Tab> [Both] Cycle over windows.
--     <C-c> [Chat] to close chat window.
--     <C-u> [Chat] scroll up chat window.
--     <C-d> [Chat] scroll down chat window.
--     <C-k> [Chat] to copy/yank code from last answer.
--     <C-n> [Chat] Start new session.
--     <C-i> [Edit Window] use response as input.
--     <C-d> [Edit Window] view the diff between left and right panes and use diff-mode commands
--
-- When the setting window is opened (with <C-o>), settigs can be modified by pressing Enter on the related config. Settings are saved across sections

return {
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}

-- return {
--   {
--     "robitx/gp.nvim",
--     config = function()
--       require("gp").setup({
--         chat_model = { model = "gpt-3.5-turbo-16k", temperature = 1.1, top_p = 1 },
--       })
--
--       -- or setup with your own config (see Install > Configuration in Readme)
--       -- require("gp").setup(conf)
--
--       -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
--     end,
--   },
-- }
