-- ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy plugins
require("lazy").setup({
    -- themes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false, -- load during startup
        priority = 1000 -- load before other plugins
    },
    {
        'projekt0n/github-nvim-theme',
        lazy = false, -- load before startup
        priority = 999, -- load before other plugins
        config = function()
            require('github-theme').setup({})
        end,
    },
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    -- neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    },
    -- gitsigns
    {"lewis6991/gitsigns.nvim"},
    -- lsp
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    -- vim-tmux-navigator
    {"christoomey/vim-tmux-navigator", lazy = false},
})
