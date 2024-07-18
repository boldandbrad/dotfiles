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
        "denols", -- deno js/ts
        "elmls",  -- elm
        "gopls",  -- golang
        -- "html",         -- html
        -- "htmx",         -- htmx
        "lua_ls",        -- lua
        "ruff_lsp",      -- python
        "rust_analyzer", -- rust
        "taplo",         -- toml
        "tsserver",      -- js/ts
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
      },
    })

    -- TODO: move this somewhere else
    -- configure diagnostics
    vim.diagnostic.config({
      signs = false,
      severity_sort = true,
      virtual_text = {
        source = true,
        spacing = 8,
      },
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      }
    })
  end,
}
