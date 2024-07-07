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
    { "<leader>m",  "<cmd>Grapple toggle<cr>",          desc = "Grapple toggle current buffer tag" },
    { "<leader>M",  "<cmd>Grapple toggle_tags<cr>",     desc = "Grapple open tags window" },
    { "<leader>n",  "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
    { "<leader>p",  "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },

    { "<leader>b1", "<cmd>Grapple select index=1<cr>",  desc = "Select first tagged buffer" },
    { "<leader>b2", "<cmd>Grapple select index=2<cr>",  desc = "Select second tagged buffer" },
    { "<leader>b3", "<cmd>Grapple select index=3<cr>",  desc = "Select third tagged buffer" },
    { "<leader>b4", "<cmd>Grapple select index=4<cr>",  desc = "Select fourth tagged buffer" },
  }
}
