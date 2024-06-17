return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- nav buttons
    dashboard.section.buttons.val = {
      dashboard.button("SPC f f", "  Find files", "<cmd>Telescope find_files <cr>"),
      dashboard.button("SPC h l", "󰉻  Harpoon swap list",
        "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) <cr>"),
      dashboard.button("SPC f r", "  Recent files", "<cmd>Telescope oldfiles <cr>"),
      dashboard.button("SPC -", "󰙅  File explorer", "<cmd>lua require('yazi').yazi() <cr>"),
      dashboard.button("SPC f t", "󱎸  Find text", "<cmd>Telescope live_grep <cr>"),
      dashboard.button("SPC g s", "󱖫  Git status", "<cmd>G <cr>"),
      dashboard.button("SPC f d", "  Find todos", "<cmd>TodoTelescope <cr>"),
      dashboard.button("SPC p", "󰩦  Plugins", "<cmd>Lazy home <cr>"),
      dashboard.button("SPC d", "󰕮  Toggle dashboard", "<cmd>Alpha<cr>"),
      dashboard.button("SPC t m", "  Toggle terminal", "<cmd>ToggleTerm <cr>"),
      dashboard.button("q", "  Quit Neovim", "<cmd>qa<CR>"),
    }

    -- build footer
    vim.api.nvim_create_autocmd("User", {
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100) / 100
        local stats_line = "󱐌 Loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"

        local v = vim.version()
        local version_line = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

        local stats_line_width = vim.fn.strdisplaywidth(stats_line)
        local version_line_padded = string.rep(" ", (stats_line_width - vim.fn.strdisplaywidth(version_line)) / 2) ..
            version_line

        dashboard.section.footer.val = {
          stats_line, "", version_line_padded
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    alpha.setup(dashboard.config)

    -- keymaps
    vim.keymap.set("n", "<leader>d", "<cmd>Alpha<cr>", { desc = "Toggle dashboard" })
  end,
}
