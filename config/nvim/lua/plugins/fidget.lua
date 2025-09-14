----------------------------------------------------------------
-- fidget.nvim - notifications and lsp progress ui            --
----------------------------------------------------------------

return {
  "j-hui/fidget.nvim",
  opts = {
    progress = {
      display = { done_icon = " " }
    },
    notification = {
      override_vim_notify = true,
      view = { stack_upwards = false },
      window = { winblend = 0 },
    },
  },
}
