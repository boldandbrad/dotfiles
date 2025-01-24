----------------------------------------------------------------
-- grug-far.nvim - find and replace                           --
----------------------------------------------------------------

return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  opts = {
    windowCreationCommand = "botright vsplit",
    icons = {
      enabled = false,
    },
  },
  keys = {
    { "<leader>R", "<cmd>GrugFar<cr>", desc = "Find and replace" },
    {
      "<leader>rw",
      function()
        require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Find and replace current word",
    },
    {
      "<leader>rb",
      function()
        require('grug-far').open({ prefills = { flags = vim.fn.expand("%") } })
      end,
      desc = "Find and replace in current file",
    },
  },
}
