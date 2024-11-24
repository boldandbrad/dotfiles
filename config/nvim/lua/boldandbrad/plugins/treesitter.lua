----------------------------------------------------------------
-- nvim-treesitter - tree-sitter integration                  --
----------------------------------------------------------------

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- only load treesitter in buffers
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "lua",
        "query",
        "vim",
        "vimdoc",
        "go",
        "html",
        "json",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "toml",
        "typescript",
        "yaml",
      },
      sync_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          scope_incremental = "<cr>",
          node_incremental = "<tab>",
          node_decremental = "<s-tab>",
        },
      },
    })
  end,
}
