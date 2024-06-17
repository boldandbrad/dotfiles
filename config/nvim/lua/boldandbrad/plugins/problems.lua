return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        height = 16,
      })
      vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle() end,
        { desc = "Toggle Trouble" })
      vim.keymap.set("n", "<leader>tn", function()
        require("trouble").next({
          skip_groups = true,
          jump = true,
        })
      end, { desc = "Trouble next" })
      vim.keymap.set("n", "<leader>tp", function()
        require("trouble").previous({
          skip_groups = true,
          jump = true,
        })
      end, { desc = "Trouble previous" })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    config = function()
      require("todo-comments").setup()
      vim.keymap.set("n", "<leader>td", "<cmd>TodoTrouble<cr>")
      vim.keymap.set("n", "<leader>fd", "<cmd>TodoTelescope<cr>", { desc = "Find TODO comments" })
    end
  },
}
