return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find files", ":Telescope find_files <CR>"),
      dashboard.button("h", "󰉻  Harpoon menu", ":normal \"1 hm\" <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("e", "󰙅  File explorer", ":Oil <CR>"),
      dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("g", "󱖫  Git status", ":G <CR>"),
      dashboard.button("SPC a", "󰕮  Toggle dashboard", ":Alpha <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }
    alpha.setup(dashboard.config)

    vim.keymap.set("n", "<leader>a", ":Alpha <CR>", opts)
  end,
}
