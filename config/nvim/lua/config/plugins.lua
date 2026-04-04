----------------------------------------------------------------
-- nvim plugin setup                                          --
----------------------------------------------------------------

vim.pack.add({
  { src = "https://github.com/catppuccin/nvim",                 name = "catppuccin" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/rmagatti/auto-session" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

-- catppuccin setup
vim.cmd([[colorscheme catppuccin]])
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  float = { transparent = true, solid = false },
  integrations = {
    fidget = true,
    gitsigns = {
      enabled = true,
      transparent = true,
    },
    native_lsp = { enabled = true },
    snacks = {
      enabled = true,
      indent_scope_color = "peach",
    },
    treesitter = true,
    which_key = true,
  },
})

-- treesitter setup
local autocmd = vim.api.nvim_create_autocmd
local treesitter = require("nvim-treesitter")
treesitter.install({ "go", "html", "javascript", "markdown", "markdown_inline", "ruby", "typescript" })
autocmd("PackChanged", { callback = function() treesitter.update() end })

-- which-key setup
require("which-key").setup({
  spec = {
    { "<leader>b", group = "Buffer" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>h", group = "Help" },
    { "<leader>j", group = "Jump" },
    { "<leader>r", group = "Replace" },
    { "<leader>s", group = "Search" },
    { "<leader>t", group = "Terminal" },
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

-- snacks setup
require("snacks").setup({
  bufdelete = { enabled = true },
  dashboard = { enabled = true },
  explorer = { replace_netrw = true },
  gitbrowse = { enabled = true },
  indent = { enabled = true },
  input = { icon = "> " },
  lazygit = { config = { gui = { nerdFontsVersion = "" } } },
  picker = {
    prompt = "> ",
    icons = { files = { enabled = false } },
  },
  words = { debounce = 100 },
})

-- bufdelete
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>bD", function() Snacks.bufdelete.all() end, { desc = "Delete all buffers" })
vim.keymap.set("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete all buffers except current" })

-- git
vim.keymap.set("n", "<leader>go", function() Snacks.gitbrowse() end, { desc = "Open current buffer on GitHub" })
vim.keymap.set("n", "<leader>G", function() Snacks.lazygit() end, { desc = "Open LazyGit" })

-- picker
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Find files smartly" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep({ hidden = true }) end, { desc = "Find text" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Search command history" })
vim.keymap.set("n", "<leader>;", function() Snacks.picker.resume() end, { desc = "Resume last picker" })
vim.keymap.set(
  "n",
  "<leader>.",
  function()
    Snacks.picker.explorer({ hidden = true, layout = { layout = { position = "right" } } })
  end,
  { desc = "Toggle file explorer" }
)
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find git files" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Find recent files" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
  { desc = "Find neovim config files" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fl", function() Snacks.picker.lines() end, { desc = "Find lines" })
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics() end, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Find help pages" })
vim.keymap.set({ "n", "x" }, "<leader>fw", function() Snacks.picker.grep_word() end,
  { desc = "Find selection or word" })
vim.keymap.set(
  "n",
  "<leader>ft",
  function()
    Snacks.picker.grep({
      live = false,
      search = function()
        local pattern = [[\b(TODO|FIX):]]
        return ({ pattern })[1]
      end,
    })
  end,
  { desc = "Find todos" }
)

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
