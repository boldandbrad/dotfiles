return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    -- find string
    vim.keymap.set("n", "<leader>fs", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)
    -- find current word
    vim.keymap.set("n", "<leader>fws", function()
      local word = vim.fm.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    -- find current full word
    vim.keymap.set("n", "<leader>fWs", function()
      local word = vim.fm.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
  end
}
