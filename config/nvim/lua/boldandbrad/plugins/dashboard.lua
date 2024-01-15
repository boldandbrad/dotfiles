return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val = {
      dashboard.button("SPC f f", "  Find files", ":Telescope find_files <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("SPC f r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("SPC f t", "󱎸  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }
    alpha.setup(dashboard.opts)
  end,
}
