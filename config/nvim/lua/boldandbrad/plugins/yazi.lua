----------------------------------------------------------------
-- yazi.nvim - yazi file manager integration                  --
----------------------------------------------------------------

return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>.",
      function()
        require("yazi").yazi()
      end,
      desc = "Open file manager (Yazi)",
    },
    {
      -- Open in the current working directory
      "<leader>c",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open file manager in nvim's cwd (Yazi)",
    },
  },
  opts = {
    open_for_directories = true,
  },
}
