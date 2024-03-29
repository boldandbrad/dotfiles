----------------------------------------------------------------
-- nvim keymaps                                               --
----------------------------------------------------------------

-- default keymap options
local opts = { noremap = true, silent = true }

-- local alias
local keymap = vim.keymap.set

-- remap leader to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

----------------------------------------------------------------
-- normal mode ("n")                                          --
----------------------------------------------------------------

keymap("n", "<leader>pv", vim.cmd.Ex, opts)

-- format current buffer
keymap("n", "<leader>fm", vim.lsp.buf.format, opts)

----------------------------------------------------------------
-- insert mode ("i")                                          --
----------------------------------------------------------------

----------------------------------------------------------------
-- visual mode ("v")                                          --
----------------------------------------------------------------

-- swap lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

----------------------------------------------------------------
-- visual block mode ("x")                                    --
----------------------------------------------------------------

----------------------------------------------------------------
-- term mode ("t")                                            --
----------------------------------------------------------------

----------------------------------------------------------------
-- command mode ("c")                                         --
----------------------------------------------------------------
