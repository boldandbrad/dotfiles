----------------------------------------------------------------
-- yazi.nvim - yazi file manager integration                  --
----------------------------------------------------------------

return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>-",
      function()
        require("yazi").yazi()
      end,
      desc = "Open file manager (Yazi)",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open file manager in nvim's working directory",
    },
  },
  opts = {
    open_for_directories = true,
  },
}
