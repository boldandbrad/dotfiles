----------------------------------------------------------------
-- lazygit.nvim - lazygit integration                         --
----------------------------------------------------------------

return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    -- needed for floating window border decoration
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>G", "<cmd>LazyGit<cr>", desc = "Open git client (LazyGit)" }
  }
}
