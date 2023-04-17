local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom" -- bottom, top
    }
  }

  local keymaps_f = nil
  local keymaps_p = nil
  local keymaps_d = nil
  local keymaps_c = nil
  -- local keymaps_u = nil

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
  }

  keymaps_f = {
    name = "Find",
    -- f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
    -- b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
    -- o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
    -- g = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
    -- c = { "<cmd>FzfLua commands<cr>", "Commands" },
    p = {"<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files"},
    b = {"<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers"},
    o = {"<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Old Files"},
    g = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep"},
    G = {"<cmd>lua require('telescope.builtin').git_files()<cr>", "Git Files"},
    c = {"<cmd>lua require('telescope.builtin').commands()<cr>", "Commands"},
    -- r = {"<cmd>Telescope file_browser<cr>", "Browser"},
    -- w = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer"},
    e = {"<cmd>NvimTreeToggle<cr>", "Explorer"},
    t = {"<cmd>lua require('telescope.builtin').tags()<cr>", "ctags"},
    m = {"<cmd>lua require('telescope.builtin').marks()<cr>", "Vim Marks"},
    S = {
      "<cmd>lua require('telescope.builtin').spell_suggest()<cr>",
      "Spell Suggestions"
    },
    n = {"<cmd>lua require('nvim-navbuddy').open()<cr>", "Code Navigation"}
    -- N = {'<cmd>edit <C-R>=expand("%:p:h") . "/" <CR>', "New File"}
    -- N = {'<cmd>edit <C-R>=fnamemodify(@%, "%:p:h")<cr>/<cr>', "New File"}
  }

  keymaps_p = {
    name = "Project",
    p = {"<cmd>lua require'telescope'.extensions.project.project{}<cr>", "List"},
    s = {"<cmd>Telescope repo list<cr>", "Search"}
  }

  keymaps_d = {
    name = "Vimspector",
    G = {
      "<cmd>lua require('config.vimspector').generate_debug_profile()<cr>",
      "Generate Debug Profile"
    }
    -- I = {"<cmd>VimspectorInstall<cr>", "Install"},
    -- U = {"<cmd>VimspectorUpdate<cr>", "Update"},
    -- R = {"<cmd>call vimspector#RunToCursor()<cr>", "Run to Cursor"},
    -- c = {"<cmd>call vimspector#Continue()<cr>", "Continue"},
    -- i = {"<cmd>call vimspector#StepInto()<cr>", "Step Into"},
    -- o = {"<cmd>call vimspector#StepOver()<cr>", "Step Over"},
    -- s = {"<cmd>call vimspector#Launch()<cr>", "Start"},
    -- t = {"<cmd>call vimspector#ToggleBreakpoint()<cr>", "Toggle Breakpoint"},
    -- u = {"<cmd>call vimspector#StepOut()<cr>", "Step Out"},
    -- S = {"<cmd>call vimspector#Stop()<cr>", "Stop"},
    -- r = {"<cmd>call vimspector#Restart()<cr>", "Restart"},
    -- x = {"<cmd>VimspectorReset<cr>", "Reset"},
    -- H = {
    --   "<cmd>lua require('config.vimspector').toggle_human_mode()<cr>",
    --   "Toggle HUMAN mode"
    -- }
  }

  -- keymaps_u = {
  --   name = "Utils",
  --   u = {"<cmd>i<C-R>=trim(system('uuidgen'))<CR><ESC>", "Generate UUID"}
  -- }
  --
  -- keymaps_a = {
  --   name = "AI assist",
  --   i = {"<cmd>codeium#Accept()", "Accept suggestion"},
  --   c = {"<cmd>codeium#Complete()", "Complete suggestion"},
  --   n = {"<cmd>codeium#Next()", "Next suggestion"},
  --   p = {"<cmd>codeium#Previous()", "Previous suggestion"},
  --   C = {"<cmd>codeium#Clear()", "Clear suggestion"}
  -- }
  keymaps_c = {
    name = "OpenAI",
    e = {
      function() chatgpt.edit_with_instructions() end, "Edit with instructions"
    }
  }

  local mappings = {
    ["w"] = {"<cmd>update!<CR>", "Save"},
    ["q"] = {"<cmd>q!<CR>", "Quit"},

    b = {
      name = "Buffer",
      c = {"<Cmd>bd!<Cr>", "Close current buffer"},
      D = {"<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers"}
    },

    c = keymaps_c,
    d = keymaps_d,
    f = keymaps_f,
    g = {
      name = "Git",
      T = {"<cmd>Neogit<CR>", "Status"},
      n = {"<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk"},
      p = {"<cmd>Gitsigns next_hunk<cr>", "Next Hunk"},
      P = {"<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk"},
      V = {"<cmd>Gitsigns select_hunk<cr>", "Select Hunk"},
      d = {"<cmd>Gitsigns diffthis<cr>", "Diff File"},
      b = {"<cmd>Gitsigns blame_line<cr>", "Blame Line"},
      B = {
        "<cmd>Gitsigns toggle_current_line_blame<cr>",
        "Toggle Current Line Blame"
      },
      s = {"<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk"},
      r = {"<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk"},
      S = {"<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer"},
      R = {"<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer"}
    },

    p = keymaps_p,

    z = {
      name = "Packer",
      c = {"<cmd>PackerCompile<cr>", "Compile"},
      i = {"<cmd>PackerInstall<cr>", "Install"},
      s = {"<cmd>PackerSync<cr>", "Sync"},
      S = {"<cmd>PackerStatus<cr>", "Status"},
      u = {"<cmd>PackerUpdate<cr>", "Update"}
    },

    D = {
      name = "Database",
      u = {"<Cmd>DBUIToggle<Cr>", "Toggle UI"},
      f = {"<Cmd>DBUIFindBuffer<Cr>", "Find buffer"},
      r = {"<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer"},
      q = {"<Cmd>DBUILastQueryInfo<Cr>", "Last query info"}
    }

  }

  local v_mappings = {c = keymaps_c}

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
  whichkey.register(v_mappings, {prefix = '<leader>', mode = 'x'})
end

return M

