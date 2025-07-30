----------------------------------------------------------------
-- nvim global keymaps                                        --
----------------------------------------------------------------

-- default keymap options
local opts = { noremap = true, silent = true }

-- local alias
local keymap = vim.keymap.set

-- remap leader to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

----------------------------------------------------------------
-- normal mode ("n")                                          --
----------------------------------------------------------------

-- the basics
keymap("n", "<leader>w", "<cmd>write<cr>", { desc = "Write" })
keymap("n", "<leader>W", "<cmd>write<cr> <cmd>quit<cr>", { desc = "Write and quit" })
keymap("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })

-- format current buffer
keymap("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer", unpack(opts) })

-- split window below
keymap("n", "<leader>-", "<cmd>split<cr>", { desc = "Split window below", unpack(opts) })

-- split window right
keymap("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Split window right", unpack(opts) })

-- navigate splits
keymap("n", "<leader><tab>", "<C-w>w", { desc = "Move to next split", unpack(opts) })
keymap("n", "<leader>H", "<C-w>h", { desc = "Move to split left", unpack(opts) })
keymap("n", "<leader>J", "<C-w>j", { desc = "Move to split down", unpack(opts) })
keymap("n", "<leader>K", "<C-w>k", { desc = "Move to split up", unpack(opts) })
keymap("n", "<leader>L", "<C-w>l", { desc = "Move to split right", unpack(opts) })

-- move lines up or down
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

-- navigate quickfix list
keymap("n", "[q", "<cmd>cprev<cr>", { desc = "Previous quickfix" })
keymap("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix" })

keymap("n", "<leader>[", "<cmd>b#<cr>", { desc = "Jump to last buffer", unpack(opts) })

keymap("n", "<leader>c", "<cmd>noh<cr>", { desc = "Clear highlights", unpack(opts) })

----------------------------------------------------------------
-- insert mode ("i")                                          --
----------------------------------------------------------------

-- move lines up or down
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })

----------------------------------------------------------------
-- visual mode ("v")                                          --
----------------------------------------------------------------

-- move lines up or down
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

----------------------------------------------------------------
-- visual block mode ("x")                                    --
----------------------------------------------------------------

----------------------------------------------------------------
-- term mode ("t")                                            --
----------------------------------------------------------------

----------------------------------------------------------------
-- command mode ("c")                                         --
----------------------------------------------------------------
