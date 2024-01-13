return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- optional
        "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        buffers = {
          follow_current_file = {
            enabled = true,
          },
        },
        filesystem = {
          filtered_items = {
            always_show = {
                ".github"
            }
          },
        },
        follow_current_file = {
            enabled = true,
        },
        window = {
          position = "right",
          width = 32,
        },
      })
    end,
  },
}
