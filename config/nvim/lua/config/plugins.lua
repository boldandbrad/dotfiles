----------------------------------------------------------------
-- nvim plugin setup                                          --
----------------------------------------------------------------

vim.pack.add({
  {
    src = "https://github.com/catppuccin/nvim",
    name = "catppuccin"
  },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
    build = ":TSUpdate"
  },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/rmagatti/auto-session" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

-- catppuccin setup
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  float = { transparent = true, solid = false },
  integrations = {
    fidget = true,
    fzf = true,
    gitsigns = {
      enabled = true,
      transparent = true,
    },
    native_lsp = { enabled = true },
    treesitter = true,
    which_key = true,
  },
})
vim.cmd([[colorscheme catppuccin]])

-- treesitter setup
local autocmd = vim.api.nvim_create_autocmd
local treesitter = require("nvim-treesitter")
local treesitter_runtime = vim.fn.stdpath("data") .. "/site/pack/core/opt/nvim-treesitter/runtime"
vim.opt.runtimepath:prepend(treesitter_runtime)
treesitter.install({ "go", "html", "javascript", "markdown", "markdown_inline", "typescript" })
autocmd("PackChanged", { callback = function() treesitter.update() end })
autocmd("FileType", { -- enable treesitter highlighting and indents
  callback = function(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)
    if vim.treesitter.language.add(lang) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start()
    end
  end
})

-- which-key setup
require("which-key").setup({
  spec = {
    { "<leader>b", group = "Buffer" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>p", group = "Pack" },
    { "<leader>s", group = "Search" },
    { "<leader>w", group = "Window" },
  },
  preset = "helix",
  show_help = false,
  plugins = {
    marks = false,
    registers = false,
  },
  icons = {
    rules = false,
    breadcrumb = ">",
    separator = ">",
  },
})

-- auto-session setup
require("auto-session").setup({})

-- fzf setup
vim.keymap.set("n", "<leader><space>", "<cmd>FzfLua global<cr>", { desc = "Global find" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>", { desc = "Find text" })
vim.keymap.set("n", "<leader>:", "<cmd>FzfLua command_history<cr>", { desc = "Search command history" })
vim.keymap.set("n", "<leader>;", "<cmd>FzfLua resume<cr>", { desc = "Resume last picker" })

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fl", "<cmd>FzfLua blines<cr>", { desc = "Find buffer lines" })
vim.keymap.set("n", "<leader>fL", "<cmd>FzfLua lines<cr>", { desc = "Find lines" })
vim.keymap.set("n", "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Find buffer diagnostics" })
vim.keymap.set("n", "<leader>fd", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "Find help" })
vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "Find current word" })
vim.keymap.set("n", "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>", { desc = "Find current WORD" })
vim.keymap.set("n", "<leader>fv", "<cmd>FzfLua grep_visual<cr>", { desc = "Find current selection" })
vim.keymap.set("n", "<leader>ft", "<cmd>FzfLua grep search=[[\\b(TODO|FIX):]] no_esc=true<cr>",
  { desc = "Find todos" })

vim.keymap.set("n", "<leader>gf", "<cmd>FzfLua git_files<cr>", { desc = "Git files" })
vim.keymap.set("n", "<leader>gs", "<cmd>FzfLua git_status<cr>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gd", "<cmd>FzfLua git_diff<cr>", { desc = "Git diff" })
vim.keymap.set("n", "<leader>gh", "<cmd>FzfLua git_hunks<cr>", { desc = "Git hunks" })

-- fidget setup
require("fidget").setup({
  progress = {
    display = { done_icon = " " }
  },
  notification = {
    override_vim_notify = true,
    view = { stack_upwards = false },
    window = { winblend = 0 },
  },
})

-- gitsigns setup
require("gitsigns").setup({})
