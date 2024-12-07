----------------------------------------------------------------
-- nvim-lspconfig - language server protocol setup            --
----------------------------------------------------------------

-- configuration inspired by https://lsp-zero.netlify.app/docs/guide/lazy-loading-with-lazy-nvim.html

return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- autocompletions
    "hrsh7th/cmp-nvim-lsp",
    -- lsp notifications
    "j-hui/fidget.nvim",
    -- proper luals config for nvim
    { "folke/lazydev.nvim", ft = "lua", opts = { library = { path = "${3rd}/luv/library", words = { "vim%.uv" } } } }
  },
  config = function()
    -- add cmp_nvim_lsp capabilities settings to lspconfig
    local lsp_defaults = require("lspconfig").util.default_config
    lsp_defaults.capabilities = vim.tbl_deep_extend(
      "force",
      lsp_defaults.capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    -- setup language servers
    local lspconfig = require("lspconfig")
    lspconfig.denols.setup({
      -- handle markdown, html, css, and json
      filetypes = { "javascript", "typescript", "markdown", "html", "css", "json", "yaml" },
    })
    lspconfig.gopls.setup({})
    lspconfig.lua_ls.setup({})
    lspconfig.ruff.setup({})  -- python
    lspconfig.rust_analyzer.setup({})
    lspconfig.taplo.setup({}) -- toml
  end,
}
