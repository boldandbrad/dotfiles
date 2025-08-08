----------------------------------------------------------------
-- nvim-treesitter - tree-sitter integration                  --
----------------------------------------------------------------

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "go", "html", "javascript", "typescript", "python", "rust" },
    highlight = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
