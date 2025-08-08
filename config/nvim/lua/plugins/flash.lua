----------------------------------------------------------------
-- flash.nvim - search-based navigation motions               --
----------------------------------------------------------------

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    prompt = { enabled = false },
    modes = {
      char = { jump_labels = true },
    },
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search"
    },
    { "<c-s>",      mode = "c", function() require("flash").toggle() end,                                     desc = "Toggle flash search" },

    { "<leader>jr", mode = "n", function() require("flash").jump({ continue = true }) end,                    desc = "Resume last jump search" },
    { "<leader>jw", mode = "n", function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "Jump search current word" },
  },
}
