----------------------------------------------------------------
-- nvim options                                               --
----------------------------------------------------------------

local opt = vim.opt

-- ui
opt.number = true                               -- show line numbers
opt.relativenumber = true                       -- make line numbers relative to current line
opt.cursorline = true                           -- highlight the current line
opt.colorcolumn = "80"                          -- highlight the given column
opt.signcolumn = "yes"                          -- always show the sign column to avoid shifting
opt.wrap = false                                -- do not wrap lines
opt.scrolloff = 8                               -- keep lines above and below the cursor
opt.sidescrolloff = 8                           -- keep characters left and right of the cursor (wrap must be false)
opt.winborder = "rounded"                       -- use rounded borders for floating windows
opt.list = true                                 -- show whitespace characters
opt.listchars = "tab:>-,trail:·,nbsp:·,space:·" -- whitespace characters to show
opt.termguicolors = true                        -- true color support
opt.guicursor = ""                              -- disable per-mode cursor styles
opt.showmatch = true                            -- jump to matching bracket on insert
opt.fillchars = { eob = " " }                   -- do not show ~ after the end of the buffer

-- indent
opt.tabstop = 2        -- number of spaces to insert for a tab
opt.shiftwidth = 2     -- size of an indent
opt.shiftround = true  -- round indent to multiple of shiftwidth
opt.softtabstop = 2    -- how many spaces tabs "feel" like
opt.expandtab = true   -- convert tabs to spaces
opt.smartindent = true -- smart indentation
opt.autoindent = true  -- auto indentation

-- search
opt.ignorecase = true -- case insensitive search
opt.smartcase = true  -- override ignore case when search contains capital letters
opt.hlsearch = false  -- do not highlight search results
opt.incsearch = true  -- show search matches as you type

-- splits
opt.splitbelow = true    -- split below when splitting vertically
opt.splitright = true    -- split right when splitting horizontally
opt.splitkeep = "screen" -- keep the cursor position on the same line when modifying horizontal splits

-- statusline
opt.laststatus = 3                                              -- always show statusline on all windows
opt.showmode = false                                            -- do not show '--INSERT--' etc in last line
opt.statusline = "%!v:lua.require('config.statusline').build()" -- custom statusline

-- files
opt.swapfile = false -- disable swapfiles
opt.undofile = true  -- enable persistent undo history

-- other
opt.confirm = true                                   -- confirm to save changes when exiting modified buffer
opt.clipboard = "unnamedplus"                        -- use system clipboard
opt.completeopt = { "menuone", "noselect", "popup" } -- show completions popup even when only one option exists
opt.timeoutlen = 300                                 -- shorten timeout for keymaps to complete

-- diagnostics config
vim.diagnostic.config({
  signs = false,
  severity_sort = true,
  virtual_text = {
    source = true,
    spacing = 8,
  },
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
  }
})
