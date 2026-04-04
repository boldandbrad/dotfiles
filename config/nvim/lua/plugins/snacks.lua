----------------------------------------------------------------
-- snacks.nvim - quality of life enhancements                 --
----------------------------------------------------------------

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bufdelete = { enabled = true },
    dashboard = { enabled = true },
    explorer = { replace_netrw = true },
    gitbrowse = { enabled = true },
    indent = { enabled = true },
    input = { icon = "> " },
    lazygit = { config = { gui = { nerdFontsVersion = "" } } },
    picker = {
      prompt = "> ",
      icons = { files = { enabled = false } },
    },
    words = { debounce = 100 },
  },
  keys = {
    -- bufdelete
    { "<leader>bd",      function() Snacks.bufdelete() end,                    desc = "Delete current buffer" },
    { "<leader>bD",      function() Snacks.bufdelete.all() end,                desc = "Delete all buffers" },
    { "<leader>bo",      function() Snacks.bufdelete.other() end,              desc = "Delete all buffers except current" },

    -- git
    { "<leader>go",      function() Snacks.gitbrowse() end,                    desc = "Open current buffer on GitHub" },
    { "<leader>G",       function() Snacks.lazygit() end,                      desc = "Open LazyGit" },

    -- picker
    { "<leader><space>", function() Snacks.picker.smart() end,                 desc = "Find files smartly" },
    { "<leader>/",       function() Snacks.picker.grep({ hidden = true }) end, desc = "Find text" },
    { "<leader>:",       function() Snacks.picker.command_history() end,       desc = "Search command history" },
    { "<leader>;",       function() Snacks.picker.resume() end,                desc = "Resume last picker" },
    {
      "<leader>.",
      function()
        Snacks.picker.explorer({ hidden = true, layout = { layout = { position = "right" } } })
      end,
      desc = "Toggle file explorer"
    },
    { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end,                  desc = "Find files" },
    { "<leader>fg", function() Snacks.picker.git_files() end,                               desc = "Find git files" },
    { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Find recent files" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find neovim config files" },
    { "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Find buffers" },
    { "<leader>fl", function() Snacks.picker.lines() end,                                   desc = "Find lines" },
    { "<leader>fd", function() Snacks.picker.diagnostics() end,                             desc = "Find diagnostics" },
    { "<leader>fh", function() Snacks.picker.help() end,                                    desc = "Find help pages" },
    { "<leader>fw", function() Snacks.picker.grep_word() end,                               desc = "Find selection or word",  mode = { "n", "x" } },
    {
      "<leader>ft",
      function()
        Snacks.picker.grep({
          live = false,
          search = function()
            local pattern = [[\b(TODO|FIX):]]
            return ({ pattern })[1]
          end,
        })
      end,
      desc = "Find todos"
    },
  }
}
