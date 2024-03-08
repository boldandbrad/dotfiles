return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find files", ":Telescope find_files <CR>"),
      dashboard.button("h", "󰉻  Harpoon list", ":normal \"1 hl\" <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("e", "󰙅  File explorer", ":Oil <CR>"),
      dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("g", "󱖫  Git status", ":G <CR>"),
      dashboard.button("SPC f d", "  Find todos", ":TodoTelescope <CR>"),
      dashboard.button("p", "󰩦  Plugins", ":Lazy home <CR>"),
      dashboard.button("SPC d", "󰕮  Toggle dashboard", ":Alpha <CR>"),
      dashboard.button("SPC t m", "  Toggle terminal", ":ToggleTerm <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }
    alpha.setup(dashboard.config)

    vim.keymap.set("n", "<leader>d", ":Alpha <CR>")
  end,
}
