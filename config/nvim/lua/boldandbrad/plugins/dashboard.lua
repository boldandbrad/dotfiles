return {
  "goolord/alpha-nvim",
  config = function()
    -- TODO: update config to show correct keymaps
    require("alpha").setup(require("alpha.themes.dashboard").config)
  end,
}
