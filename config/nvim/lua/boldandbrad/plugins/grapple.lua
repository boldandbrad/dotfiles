----------------------------------------------------------------
-- grapple.nvim - file tagging and jumping                    --
----------------------------------------------------------------

return {
  "cbochs/grapple.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  opts = {
    scope = "git",
    icons = false,
    win_opts = {
      border = "rounded",
    },
  },
  keys = {
    { "<leader>m",  "<cmd>Grapple toggle<cr>",          desc = "Toggle buffer tag (Grapple)" },
    { "<leader>M",  "<cmd>Grapple toggle_tags<cr>",     desc = "Open tagged buffer list (Grapple)" },
    { "<leader>n",  "<cmd>Grapple cycle_tags next<cr>", desc = "Next tagged buffer (Grapple)" },
    { "<leader>p",  "<cmd>Grapple cycle_tags prev<cr>", desc = "Previous tagged buffer (Grapple)" },

    { "<leader>j1", "<cmd>Grapple select index=1<cr>",  desc = "1st tagged buffer (Grapple)" },
    { "<leader>j2", "<cmd>Grapple select index=2<cr>",  desc = "2nd tagged buffer (Grapple)" },
    { "<leader>j3", "<cmd>Grapple select index=3<cr>",  desc = "3rd tagged buffer (Grapple)" },
    { "<leader>j4", "<cmd>Grapple select index=4<cr>",  desc = "4th tagged buffer (Grapple)" },
  },
}
