----------------------------------------------------------------
-- nvim options                                               --
----------------------------------------------------------------

local options = {
  autoindent = true,                           -- auto indentation
  clipboard = "unnamedplus",                   -- use system clipboard for yank, delete, change, and put operations
  -- cmdheight = 0,                               -- do not display the cmdline
  colorcolumn = "80",                          -- highlight the given column
  completeopt = "menuone,preview",             -- show completions popup even when only one option exists
  cursorline = true,                           -- highlight the current line
  expandtab = true,                            -- convert tabs to spaces
  hlsearch = false,                            -- do not highlight search results
  guicursor = "",                              -- disable per-mode cursor styles
  ignorecase = true,                           -- case insensitive search
  list = true,                                 -- show whitespace characters
  listchars = "tab:>-,trail:·,nbsp:·,space:·", -- whitespace characters to show
  number = true,                               -- show line numbers
  relativenumber = true,                       -- make line numbers relative to current line
  scrolloff = 8,                               -- minimal number of screen lines to keep above and below the cursor
  shiftwidth = 2,                              -- size of an indent
  showmode = false,                            -- do not show '--INSERT--' etc in last line
  sidescrolloff = 8,                           -- minimal number of screen columns either side of cursor if wrap is `false`
  signcolumn = "yes",                          -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,                            -- override ignore case when search contains capital letters
  smartindent = true,                          -- smart indentation
  softtabstop = 2,                             -- how many spaces tabs "feel" like
  splitbelow = true,                           -- split below when splitting vertically
  splitright = true,                           -- split right when splitting horizontally
  swapfile = false,                            -- disable swapfiles
  tabstop = 2,                                 -- number of spaces to insert for a tab
  termguicolors = true,                        -- true color support
  undofile = true,                             -- enable persistent undo history
  winborder = "rounded",                       -- rounded borders for floating windows
  wrap = false,                                -- disable line wrap
}

for key, val in pairs(options) do
  vim.opt[key] = val
end

-- restorable session types
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

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
