return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        -- may need to remap this?
        keys = {
          { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
        },
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
