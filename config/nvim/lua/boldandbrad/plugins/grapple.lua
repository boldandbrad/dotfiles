----------------------------------------------------------------
-- grapple.nvim - file tagging and jumping                    --
----------------------------------------------------------------

return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  opts = {
    scope = "git",
    win_opts = {
      border = "rounded",
    },
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  keys = {
    { "<leader>m",  "<cmd>Grapple toggle<cr>",          desc = "Toggle current buffer tag (Grapple)" },
    { "<leader>M",  "<cmd>Grapple toggle_tags<cr>",     desc = "Open tagged buffer list (Grapple)" },
    { "<leader>n",  "<cmd>Grapple cycle_tags next<cr>", desc = "Next tagged buffer (Grapple)" },
    { "<leader>p",  "<cmd>Grapple cycle_tags prev<cr>", desc = "Previous tagged buffer (Grapple)" },

    { "<leader>j1", "<cmd>Grapple select index=1<cr>",  desc = "Jump to 1st tagged buffer (Grapple)" },
    { "<leader>j2", "<cmd>Grapple select index=2<cr>",  desc = "Jump to 2nd tagged buffer (Grapple)" },
    { "<leader>j3", "<cmd>Grapple select index=3<cr>",  desc = "Jump to 3rd tagged buffer (Grapple)" },
    { "<leader>j4", "<cmd>Grapple select index=4<cr>",  desc = "Jump to 4th tagged buffer (Grapple)" },
  }
}
