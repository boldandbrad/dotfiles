----------------------------------------------------------------
-- telescope.nvim - finder and picker                         --
----------------------------------------------------------------

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "jonarrien/telescope-cmdline.nvim",
    "cbochs/grapple.nvim",
  },
  init = function()
    -- enable extensions
    require("telescope").load_extension("cmdline")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("grapple")
    require("boldandbrad.custom.telescope.multigrep").setup()
  end,
  opts = {
    defaults = {
      -- include hidden files excluding .git/ in live_grep and grep_string results
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob",
        "!**/.git/*",
      },
    },
    pickers = {
      find_files = {
        -- include hidden files excluding .git/ in find_files results
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
    extensions = {
      fzf = {},
    },
  },
  keys = {
    { ":",          "<cmd>Telescope cmdline<cr>",      desc = "Cmdline" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>",    desc = "Find git files" },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>",    desc = "Find text" },
    { "<leader>fb", "<cmd>Telescope grapple tags<cr>", desc = "Find tagged buffers" },
    { "<leader>fB", "<cmd>Telescope buffers<cr>",      desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",    desc = "Find help tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",     desc = "Find recent files" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>",  desc = "Find current word" },
    {
      "<leader>fW",
      function()
        local word = vim.fn.expand("<cWORD>")
        require("telescope.builtin").grep_string({ search = word })
      end,
      desc = "Find current full word",
    },
    {
      "<leader>fv",
      function()
        require("telescope.builtin").find_files {
          cwd = vim.fn.stdpath("config")
        }
      end,
      desc = "Find neovim config files",
    }
  },
}
