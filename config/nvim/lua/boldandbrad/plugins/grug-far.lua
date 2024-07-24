----------------------------------------------------------------
-- grug-far.nvim - find and replace                           --
----------------------------------------------------------------

return {
  "MagicDuck/grug-far.nvim",
  opts = {
    windowCreationCommand = "botright vsplit",
    icons = {
      enabled = false,
    },
  },
  keys = {
    { "<leader>R", "<cmd>GrugFar<cr>", desc = "Find and replace (GrugFar)" },
    {
      "<leader>rw",
      function()
        require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Find and replace current word (GrugFar)",
    },
    {
      "<leader>rb",
      function()
        require('grug-far').grug_far({ prefills = { flags = vim.fn.expand("%") } })
      end,
      desc = "Find and replace in current file (GrugFar)",
    },
  },
}
