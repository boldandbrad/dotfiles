return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    gitbrowse = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = {
      config = {
        gui = { nerdFontsVersion = "", },
      },
    },
    picker = {
      prompt = "> ",
      icons = {
        files = { enabled = false },
      },
    },
    styles = {
      lazygit = {
        border = "rounded"
      }
    },
  },
  keys = {
    -- gitbrowse
    { "<leader>go", function() Snacks.gitbrowse() end,                                      desc = "Open current buffer on GitHub" },

    -- lazygit
    { "<leader>G",  function() Snacks.lazygit() end,                                        desc = "Open LazyGit" },

    -- picker
    { "<leader>/",  function() Snacks.picker.grep() end,                                    desc = "Grep text" },
    { "<leader>:",  function() Snacks.picker.command_history() end,                         desc = "Search command history" },
    { "<leader>;",  function() Snacks.picker.resume() end,                                  desc = "Resume last picker" },

    { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find files" },
    { "<leader>fg", function() Snacks.picker.git_files() end,                               desc = "Find git files" },
    { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Find recent files" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find config rile" },
    { "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Find buffers" },
    { "<leader>fl", function() Snacks.picker.lines() end,                                   desc = "Find lines" },
    { "<leader>fp", function() Snacks.picker.lazy() end,                                    desc = "Find plugin spec" },

    { "<leader>sd", function() Snacks.picker.diagnostics() end,                             desc = "Search diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end,                                    desc = "Search help pages" },
    { "<leader>sw", function() Snacks.picker.grep_word() end,                               desc = "Grep visual selection or word", mode = { "n", "x" } },
  }
}
