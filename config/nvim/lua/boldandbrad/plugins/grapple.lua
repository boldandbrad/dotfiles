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
    { "<leader>bt", "<cmd>Grapple toggle<cr>",          desc = "Toggle buffer tag" },
    { "<leader>B",  "<cmd>Grapple toggle_tags<cr>",     desc = "Open tagged buffer list" },
    { "<leader>bn", "<cmd>Grapple cycle_tags next<cr>", desc = "Next tagged buffer" },
    { "<leader>bp", "<cmd>Grapple cycle_tags prev<cr>", desc = "Previous tagged buffer" },

    { "<leader>j1", "<cmd>Grapple select index=1<cr>",  desc = "1st tagged buffer" },
    { "<leader>j2", "<cmd>Grapple select index=2<cr>",  desc = "2nd tagged buffer" },
    { "<leader>j3", "<cmd>Grapple select index=3<cr>",  desc = "3rd tagged buffer" },
    { "<leader>j4", "<cmd>Grapple select index=4<cr>",  desc = "4th tagged buffer" },
  },
}
