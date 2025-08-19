----------------------------------------------------------------
-- nvim options                                               --
----------------------------------------------------------------

local opt = vim.opt

opt.autoindent = true                                -- auto indentation
opt.clipboard = "unnamedplus"                        -- use system clipboard for yank, delete, change, and put operations
opt.colorcolumn = "80"                               -- highlight the given column
opt.completeopt = { "menuone", "noselect", "popup" } -- show completions popup even when only one option exists
opt.cursorline = true                                -- highlight the current line
opt.expandtab = true                                 -- convert tabs to spaces
opt.hlsearch = false                                 -- do not highlight search results
opt.guicursor = ""                                   -- disable per-mode cursor styles
opt.ignorecase = true                                -- case insensitive search
opt.list = true                                      -- show whitespace characters
opt.listchars = "tab:>-,trail:·,nbsp:·,space:·"      -- whitespace characters to show
opt.number = true                                    -- show line numbers
opt.relativenumber = true                            -- make line numbers relative to current line
opt.scrolloff = 8                                    -- minimal number of screen lines to keep above and below the cursor
opt.shiftwidth = 2                                   -- size of an indent
opt.showmode = false                                 -- do not show '--INSERT--' etc in last line
opt.sidescrolloff = 8                                -- minimal number of screen columns either side of cursor if wrap is `false`
opt.signcolumn = "yes"                               -- always show the sign column to avoid shifting
opt.smartcase = true                                 -- override ignore case when search contains capital letters
opt.smartindent = true                               -- smart indentation
opt.softtabstop = 2                                  -- how many spaces tabs "feel" like
opt.splitbelow = true                                -- split below when splitting vertically
opt.splitright = true                                -- split right when splitting horizontally
opt.swapfile = false                                 -- disable swapfiles
opt.tabstop = 2                                      -- number of spaces to insert for a tab
opt.termguicolors = true                             -- true color support
opt.undofile = true                                  -- enable persistent undo history
opt.winborder = "rounded"                            -- rounded borders for floating windows
opt.wrap = false                                     -- disable line wrap

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
