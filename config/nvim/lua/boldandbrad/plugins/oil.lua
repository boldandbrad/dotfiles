return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = {},
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          if name == ".git" or name == ".DS_Store" then
            return true
          end
          return false
        end,
      },
    })

    vim.keymap.set("n", "<leader>fe", ":Oil <CR>", {})
  end
}
