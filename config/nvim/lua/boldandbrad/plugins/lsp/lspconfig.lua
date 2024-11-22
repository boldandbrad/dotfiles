----------------------------------------------------------------
-- nvim-lspconfig - language server protocol setup            --
----------------------------------------------------------------

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- language server installation
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- completions
    "hrsh7th/cmp-nvim-lsp",
    -- lsp notifications
    "j-hui/fidget.nvim",
  },
  config = function()
    require("mason-lspconfig").setup({
      -- install language servers
      ensure_installed = {
        -- "astro",        -- astro
        "denols",        -- deno js/ts
        "gopls",         -- golang
        -- "htmx",         -- htmx
        "lua_ls",        -- lua
        "ruff",          -- python
        "rust_analyzer", -- rust
        "taplo",         -- toml
      },
      -- setup language servers
      handlers = {
        function(server_name)
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,
        -- lua: handle undefined global "vim"
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            settings = {
              Lua = { diagnostics = { globals = { "vim" } } }
            }
          }
        end,
        -- deno: handle markdown, css, html, and json
        ["denols"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.denols.setup {
            filetypes = { "javascript", "typescript", "markdown", "html", "css", "json" },
          }
        end,
      },
    })
  end,
}
