----------------------------------------------------------------
-- nvim-lspconfig - language server protocol setup            --
----------------------------------------------------------------

-- configuration inspired by https://lsp-zero.netlify.app/docs/guide/lazy-loading-with-lazy-nvim.html

return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- language server installation
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- autocompletions
    "hrsh7th/cmp-nvim-lsp",
    -- lsp notifications
    "j-hui/fidget.nvim",
  },
  config = function()
    -- add cmp_nvim_lsp capabilities settings to lspconfig
    local lsp_defaults = require("lspconfig").util.default_config
    lsp_defaults.capabilities = vim.tbl_deep_extend(
      "force",
      lsp_defaults.capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    -- install and setup language servers
    require("mason-lspconfig").setup({
      ensure_installed = {
        "denols",        -- deno js/ts
        "gopls",         -- golang
        -- "htmx",         -- htmx
        "lua_ls",        -- lua
        "ruff",          -- python
        "rust_analyzer", -- rust
        "taplo",         -- toml
      },
      handlers = {
        -- default handler
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        -- lua: handle undefined global "vim"
        lua_ls = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                telemetry = { enable = false },
              }
            }
          })
        end,

        -- deno: handle markdown, css, html, and json
        denols = function()
          require("lspconfig").denols.setup({
            filetypes = { "javascript", "typescript", "markdown", "html", "css", "json", "yaml" },
          })
        end,
      },
    })
  end,
}
