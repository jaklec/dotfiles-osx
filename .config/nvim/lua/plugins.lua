local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float {border = "rounded"}
      end
    }
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" ..
                             "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use {"wbthomason/packer.nvim"}

    -- Load only when require
    use {"nvim-lua/plenary.nvim", module = "plenary"}

    -- Notification
    use {
      "rcarriga/nvim-notify",
      event = "VimEnter",
      config = function() vim.notify = require "notify" end
    }

    -- Colorscheme
    use {
      "sainnhe/edge",
      config = function()
        vim.cmd "let g:edge_style = 'default'"
        vim.cmd "let g:edge_better_performance = 1"
        vim.cmd "colorscheme edge"
      end
    }

    -- Git
    use {
      "TimUntersberger/neogit",
      cmd = "Neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function() require("config.neogit").setup() end
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function() require('gitsigns').setup() end
    }

    -- Keymappings and mnemonics
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function() require("config.whichkey").setup() end
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function() require("config.indentblankline").setup() end
    }

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup {default = true}
      end
    }

    -- -- Better Comment
    use {
      "numToStr/Comment.nvim",
      opt = true,
      keys = {"gc", "gcc", "gbc"},
      config = function() require("Comment").setup {} end
    }

    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
      ft = "markdown",
      cmd = {"MarkdownPreview"}
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "VimEnter",
      run = ":TSUpdate",
      config = function() require("config.treesitter").setup() end
    }

    use {
      "SmiteshP/nvim-navic",
      requires = "nvim-treesitter/nvim-treesitter",
      module = "nvim-navic",
      config = function() require("nvim-navic").setup() end
    }

    use {
      "SmiteshP/nvim-navbuddy",
      requires = {
        "neovim/nvim-lspconfig", "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim", -- Optional
        "nvim-telescope/telescope.nvim" -- Optional
      }
    }
    -- Status line
    use {
      "nvim-lualine/lualine.nvim",
      after = "nvim-treesitter",
      -- event = "VimEnter",
      config = function() require("config.lualine").setup() end,
      wants = "nvim-web-devicons"
      -- requires = { "nvim-web-devicons" },
    }

    -- FZF Lua
    use {
      "ibhagwan/fzf-lua",
      event = "BufEnter",
      requires = {"kyazdani42/nvim-web-devicons"}
    }

    -- nvim-tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
      cmd = {"NvimTreeToggle", "NvimTreeClose"},
      config = function() require("config.nvimtree").setup() end
    }

    -- Buffer line
    use {
      "akinsho/nvim-bufferline.lua",
      event = "BufReadPre",
      wants = "nvim-web-devicons",
      config = function() require("config.bufferline").setup() end
    }

    -- -- Motions
    -- use {"chaoren/vim-wordmotion", opt = true, fn = {"<Plug>WordMotion_w"}}

    use {
      "ms-jpq/coq_nvim",
      branch = "coq",
      event = "InsertEnter",
      -- event = "VimEnter",
      opt = true,
      run = ":COQdeps",
      config = function() require("config.coq").setup() end,
      requires = {
        {"ms-jpq/coq.artifacts", branch = "artifacts"},
        {"ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p"}
      },
      disable = false
    }

    -- Auto pairs
    use {
      "windwp/nvim-autopairs",
      wants = "nvim-treesitter",
      -- module = { "nvim-autopairs" },
      event = "InsertEnter",
      config = function() require("config.autopairs").setup() end
    }

    -- Function signature help
    use {
      "ray-x/lsp_signature.nvim",
      opt = true,
      event = "VimEnter",
      config = function() require("config.lsp_signature").setup() end
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      -- event = "BufReadPre",
      event = "VimEnter",
      -- wants = { "nvim-lsp-installer", "lsp_signature.nvim", "cmp-nvim-lsp" },  -- for nvim-cmp
      wants = {"nvim-lsp-installer", "lsp_signature.nvim", "coq_nvim"}, -- for coq.nvim
      config = function() require("config.lsp").setup() end,
      requires = {"williamboman/nvim-lsp-installer", "ray-x/lsp_signature.nvim"}
      -- dependencies = {
      --   {
      --     "SmiteshP/nvim-navbuddy",
      --     dependencies = {"SmiteshP/nvim-navic", "MunifTanjim/nui.nvim"},
      --     opts = {lsp = {auto_attach = true}}
      --   }
      -- }
    }

    -- Insights
    if PLUGINS.telescope.enabled then
      use {
        "nvim-telescope/telescope.nvim",
        opt = true,
        config = function() require("config.telescope").setup() end,
        cmd = {"Telescope"},
        module = "telescope",
        keys = {"<leader>f", "<leader>p"},
        wants = {
          "plenary.nvim", "popup.nvim", "telescope-fzf-native.nvim",
          "telescope-project.nvim", "telescope-repo.nvim",
          "telescope-file-browser.nvim", "project.nvim"
        },
        requires = {
          "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim",
          {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
          "nvim-telescope/telescope-project.nvim", "cljoly/telescope-repo.nvim",
          "nvim-telescope/telescope-file-browser.nvim", {
            "ahmedkhalf/project.nvim",
            config = function() require("project_nvim").setup {} end
          }
        }
      }
    end

    -- Formatter
    use {
      "mhartington/formatter.nvim",
      opt = true,
      event = "BufReadPre",
      config = function() require("config.formatter").setup() end
    }

    use {
      "kylechui/nvim-surround",
      tag = "*",
      config = function() require("nvim-surround").setup({}) end
    }

    use {
      "puremourning/vimspector",
      cmd = {"VimspectorInstall", "VimspectorUpdate"},
      fn = {
        "vimspector#Launch()", "vimspector#ToggleBreakpoint",
        "vimspector#Continue"
      },
      config = function() require("config.vimspector").setup() end
    }

    -- Database
    -- use {
    --   "nanotee/sqls.nvim",
    --   module = {"sqls"},
    --   cmd = {
    --     "SqlsExecuteQuery", "SqlsExecuteQueryVertical", "SqlsShowDatabases",
    --     "SqlsShowSchemas", "SqlsShowConnections", "SqlsSwitchDatabase",
    --     "SqlsSwitchConnection"
    --   }
    -- }
    use {
      "tpope/vim-dadbod",
      opt = true,
      requires = {
        "kristijanhusak/vim-dadbod-ui", "kristijanhusak/vim-dadbod-completion"
      },
      config = function() require("config.dadbod").setup() end,
      cmd = {
        "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer",
        "DBUIRenameBuffer"
      }
    }

    if PLUGINS.chatgpt.enabled then
      -- use {"0xStabby/chatgpt-vim", event = "VimEnter"}
      use({
        "jackMort/ChatGPT.nvim",
        config = function()
          require("chatgpt").setup({
            -- optional configuration
          })
        end,
        requires = {
          "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
        }
      })
    end

    if PLUGINS.codeium.enabled then
      use {
        "Exafunction/codeium.vim",
        event = "VimEnter",
        config = function() require("config.codeium").setup() end
      }
    end

    use {
      "williamboman/mason.nvim",
      config = function() require("mason").setup() end,
      run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
