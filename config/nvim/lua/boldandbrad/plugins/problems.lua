return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "<leader>tt", function()
        require("trouble").toggle()
      end)
      vim.keymap.set("n", "<leader>tn", function()
        require("trouble").next({
          skip_groups = true,
          jump = true,
        })
      end)
      vim.keymap.set("n", "<leader>tp", function()
        require("trouble").previous({
          skip_groups = true,
          jump = true,
        })
      end)
      require("trouble").setup({
        height = 16,
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    config = function()
      require("todo-comments").setup()
      vim.keymap.set("n", "<leader>td", ":TodoTrouble <CR>")
      vim.keymap.set("n", "<leader>fd", ":TodoTelescope <CR>")
    end
  },
}
