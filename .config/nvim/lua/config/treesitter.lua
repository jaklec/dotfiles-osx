local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
		ensure_installed = {
			"javascript", "html", "css", "bash", "lua", "json",
			"python", "rust", "c", "cmake", "cpp", "dockerfile",
			"go", "graphql", "java", "regex", "scss", "svelte",
			"toml", "typescript", "vue", "yaml", "fish", "hcl",
			"sql",
		},

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,
    },
  }
end

return M
