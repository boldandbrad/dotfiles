----------------------------------------------------------------
-- fidget.nvim - notifications and lsp progress ui            --
----------------------------------------------------------------

return {
  "j-hui/fidget.nvim",
  opts = {
    notification = {
      override_vim_notify = true,
      window = {
        -- winblend = 0,
      },
    }
  },
}
