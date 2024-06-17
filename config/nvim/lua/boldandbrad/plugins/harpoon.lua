return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup()

    -- append current buffer to harpoon jump list
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end,
      { desc = "Append current buffer to jump list" })

    -- toggle harpoon jump list menu
    vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Toggle jump list menu" })

    -- open harpoon list buffer by index
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end,
      { desc = "Open jump list buffer at index 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end,
      { desc = "Open jump list buffer at index 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end,
      { desc = "Open jump list buffer at index 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end,
      { desc = "Open jump list buffer at index 4" })
    vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end,
      { desc = "Open jump list buffer at index 5" })

    -- toggle previous & next buffers in harpoon list
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,
      { desc = "Open next jump list buffer" })
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end,
      { desc = "Open previous jump list buffer" })
  end,
}
