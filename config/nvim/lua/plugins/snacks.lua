----------------------------------------------------------------
-- snacks.nvim - quality of life enhancements                 --
----------------------------------------------------------------

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
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
      win = {
        input = {
          keys = {
            ["<a-s>"] = { "flash", mode = { "n", "i" } },
            ["s"] = { "flash" },
          },
        },
      },
      actions = {
        flash = function(picker)
          require("flash").jump({
            pattern = "^",
            label = { after = { 0, 0 } },
            search = {
              mode = "search",
              exclude = {
                function(win)
                  return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
                end,
              },
            },
            action = function(match)
              local idx = picker.list:row2idx(match.pos[1])
              picker.list:_move(idx, true, true)
            end,
          })
        end,
      },
    },
    words = {
      debounce = 100,
    },
    styles = {
      lazygit = { border = "rounded" },
    },
  },
  keys = {
    -- bufdelete
    { "<leader>bd",      function() Snacks.bufdelete() end,                    desc = "Delete buffer" },
    { "<leader>bD",      function() Snacks.bufdelete.all() end,                desc = "Delete all buffers" },
    { "<leader>bo",      function() Snacks.bufdelete.other() end,              desc = "Delete all buffers except current" },

    -- gitbrowse
    { "<leader>go",      function() Snacks.gitbrowse() end,                    desc = "Open current buffer on GitHub" },

    -- lazygit
    { "<leader>G",       function() Snacks.lazygit() end,                      desc = "Open LazyGit" },

    -- picker
    { "<leader><space>", function() Snacks.picker.smart() end,                 desc = "Smart Find Files" },
    { "<leader>/",       function() Snacks.picker.grep({ hidden = true }) end, desc = "Grep text" },
    { "<leader>:",       function() Snacks.picker.command_history() end,       desc = "Search command history" },
    { "<leader>;",       function() Snacks.picker.resume() end,                desc = "Resume last picker" },

    {
      "<leader>fe",
      function()
        Snacks.picker.explorer({ hidden = true, layout = { layout = { position = "right" } } })
      end,
      desc = "File explorer"
    },
    { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end,                  desc = "Find files" },
    { "<leader>fg", function() Snacks.picker.git_files() end,                               desc = "Find git files" },
    { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Find recent files" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find config file" },
    { "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Find buffers" },
    { "<leader>fl", function() Snacks.picker.lines() end,                                   desc = "Find lines" },
    { "<leader>fp", function() Snacks.picker.lazy() end,                                    desc = "Find plugin spec" },

    { "<leader>sd", function() Snacks.picker.diagnostics() end,                             desc = "Search diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end,                                    desc = "Search help pages" },
    { "<leader>sw", function() Snacks.picker.grep_word() end,                               desc = "Grep visual selection or word", mode = { "n", "x" } },

    -- terminal
    { "<leader>tt", function() Snacks.terminal.toggle() end,                                desc = "Toggle terminal" },
  }
}
