return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
        },
        handlers = {
          function (server_name)
            require("lspconfig")[server_name].setup {}
          end
        }
      })
    end
  },


  -- {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  -- {'hrsh7th/cmp-nvim-lsp'},
  -- {'hrsh7th/nvim-cmp'},
  -- {'L3MON4D3/LuaSnip'},
}
