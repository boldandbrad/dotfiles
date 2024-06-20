return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jonarrien/telescope-cmdline.nvim",
    "cbochs/grapple.nvim",
  },
  keys = {
    { ":", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
  },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
    vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })
    -- find current word
    vim.keymap.set("n", "<leader>fws", function()
      local word = vim.fm.expand("<cword>")
      builtin.grep_string({ search = word })
    end, { desc = "Find current word" })
    -- find current full word
    vim.keymap.set("n", "<leader>fWs", function()
      local word = vim.fm.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, { desc = "Find current full word" })
    -- enable extensions
    require("telescope").load_extension("cmdline")
    require("telescope").load_extension("grapple")
  end
}
