----------------------------------------------------------------
-- nvim-treesitter - tree-sitter integration                  --
----------------------------------------------------------------

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  enabled = true,
  lazy = false,
  build = ":TSUpdate",
  init = function()
    require("nvim-treesitter").install({ "go", "html", "javascript", "markdown", "markdown_inline", "ruby", "typescript" })
  end
}
