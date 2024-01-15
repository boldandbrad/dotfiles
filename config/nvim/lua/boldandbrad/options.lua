----------------------------------------------------------------
-- nvim options                                               --
----------------------------------------------------------------

local options = {
  guicursor = "",
  number = true,            -- show line numbers
  relativenumber = true,    -- make line numbers relative to current line
  tabstop = 4,              -- number of spaces to insert for a tab
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,         -- convert tabs to spaces
  autoindent = true,        -- auto indentation
  smartindent = true,       -- smart indentation
  list = true,              -- show whitespace characters
  listchars = "tab:>-,trail:·,nbsp:·,space:·", -- whitespace characters to show
  wrap = false,             -- disable line wrap
  scrolloff = 8,            -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,        -- minimal number of screen columns either side of cursor if wrap is `false`
  signcolumn = "yes",       -- always show the sign column, otherwise it would shift the text each time
  colorcolumn = "80",       -- highlight the given column
  cursorline = true,        -- highlight the current line
}

for key, val in pairs(options) do
  vim.opt[key] = val
end

vim.opt.clipboard:append {"unnamedplus"}
