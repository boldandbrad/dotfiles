----------------------------------------------------------------
-- obsidian.nvim - obsidian vault navigation and tooling      --
----------------------------------------------------------------

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- latest release
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "space",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/space",
      },
    },
    picker = {
      name = "telescope.nvim",
    },
  },
}
