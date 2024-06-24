return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- language server installation
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    -- snippet engine
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- lsp notifications
    "j-hui/fidget.nvim",
  },
  config = function()
    require("fidget").setup()
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- install language servers
      ensure_installed = {
        -- "astro",
        -- "denols",
        "elmls",
        "gopls",
        -- "html",
        -- "htmx",
        "lua_ls",
        "ruff_lsp", -- python
        "rust_analyzer",
        "tsserver",
      },
      -- setup language servers
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {}
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
    -- setup completions
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      snippet = {
        -- required
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {},
      mapping = cmp.mapping.preset.insert({
        -- recommended
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- prime
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
      }),
    })
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
