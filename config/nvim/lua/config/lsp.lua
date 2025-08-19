----------------------------------------------------------------
-- nvim language server protocal setup                        --
----------------------------------------------------------------

vim.lsp.enable({
  "denols",
  "gopls",
  "lua_ls",
  "marksman",
  "ruff",  -- python
  "rust_analyzer",
  "taplo", -- toml
})

-- apply custom lsp configs
vim.lsp.config("denols", {
  -- handle markdown, html, css, and json in addition to js/ts
  filetypes = { "javascript", "typescript", "markdown", "html", "css", "json", "yaml" },
  -- run lsp for js/ts in any directory
  root_dir = function() return vim.uv.cwd() end,
})
