return {
  {
      "catppuccin/nvim",
      name = "catppuccin",
      lazy = false, -- load during startup
      priority = 1000 -- load before other plugins
  },
  {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
  },
  "lewis6991/gitsigns.nvim",
  -- { "christoomey/vim-tmux-navigator", lazy = false },
}
