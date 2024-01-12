-- highlight a column
vim.opt.colorcolumn = "80"

vim.opt.guicursor = ""

-- not sure if these are needed with nvchad
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true

-- show relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- render whitespace characters
vim.opt.list = true
vim.opt.listchars = "tab:>-,trail:·,nbsp:·,space:·"

-- do not wrap lines
vim.opt.wrap = false

-- set scroll off range
vim.opt.scrolloff = 8

-- enable better system clipboard support
vim.opt.clipboard:append {"unnamedplus"}
