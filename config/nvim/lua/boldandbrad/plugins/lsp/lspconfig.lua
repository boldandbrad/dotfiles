----------------------------------------------------------------
-- nvim-lspconfig - language server protocol setup            --
----------------------------------------------------------------

-- configuration inspired in part by https://lsp-zero.netlify.app/docs/guide/lazy-loading-with-lazy-nvim.html

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- autocompletions
    "saghen/blink.cmp",
    -- lsp notifications
    "j-hui/fidget.nvim",
    -- proper luals config for nvim
    { "folke/lazydev.nvim", ft = "lua", opts = { library = { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
  },
  opts = {
    servers = {
      denols = {
        -- handle markdown, html, css, and json
        filetypes = { "javascript", "typescript", "markdown", "html", "css", "json", "yaml" },
      },
      gopls = {},
      lua_ls = {},
      marksman = {}, -- markdown
      ruff = {},     -- python
      rust_analyzer = {},
      taplo = {},    -- toml
    },
  },
  config = function(_, opts)
    -- setup language servers with blink.cmp capabilities
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
