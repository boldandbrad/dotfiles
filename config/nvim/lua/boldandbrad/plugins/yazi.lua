----------------------------------------------------------------
-- yazi.nvim - yazi file manager integration                  --
----------------------------------------------------------------

return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  opts = {
    open_for_directories = true,
  },
  keys = {
    {
      "<leader>.",
      function()
        require("yazi").yazi()
      end,
      desc = "Open file manager",
    },
    {
      -- Open in the current working directory
      "<leader>C",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open file manager at cwd",
    },
  },
}
