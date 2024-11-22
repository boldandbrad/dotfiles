----------------------------------------------------------------
-- nvim-treesitter - tree-sitter integration                  --
----------------------------------------------------------------

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- only load treesitter in buffers
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      auto_install = true,
      sync_install = true,
      ensure_installed = {
        -- required
        "lua",
        "query",
        "vim",
        "vimdoc",

        -- custom
        "go",
        -- "html",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "typescript",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
      indent = { enable = true, },
      -- incremental_selection = {
      --   enable = true,
      --   keymaps = {
      --     init_selection = "<cr>",
      --     node_incremental = "<cr>",
      --     scope_incremental = false,
      --     node_decremental = "<bs>",
      --   },
      -- },
    },
  },
}
