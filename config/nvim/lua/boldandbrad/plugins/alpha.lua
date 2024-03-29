return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val = {
      dashboard.button("SPC f f", "  Find files", ":Telescope find_files <CR>"),
      dashboard.button("SPC h l", "󰉻  Harpoon swap list", ":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) <CR>"),
      dashboard.button("SPC f r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("SPC f e", "󰙅  File explorer", ":Oil <CR>"),
      dashboard.button("SPC f t", "󱎸  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("SPC g s", "󱖫  Git status", ":G <CR>"),
      dashboard.button("SPC f d", "  Find todos", ":TodoTelescope <CR>"),
      dashboard.button("SPC p", "󰩦  Plugins", ":Lazy home <CR>"),
      dashboard.button("SPC d", "󰕮  Toggle dashboard", ":Alpha <CR>"),
      dashboard.button("SPC t m", "  Toggle terminal", ":ToggleTerm <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }
    alpha.setup(dashboard.config)

    vim.keymap.set("n", "<leader>d", ":Alpha <CR>")
  end,
}
