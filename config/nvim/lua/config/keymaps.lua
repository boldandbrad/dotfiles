----------------------------------------------------------------
-- nvim global keymaps                                        --
----------------------------------------------------------------

local keymap = vim.keymap.set

-- remap leader to space
keymap("", "<space>", "<Nop>")
vim.g.mapleader = " "

-- window splits
keymap("n", "<leader>ws", "<cmd>vsplit<cr>", { desc = "Split window right" })
keymap("n", "<leader>wS", "<cmd>split<cr>", { desc = "Split window below" })
keymap("n", "<leader>w<tab>", "<C-w>w", { desc = "Move to next split" })
keymap("n", "<leader>wh", "<C-w>h", { desc = "Move to split left" })
keymap("n", "<leader>wj", "<C-w>j", { desc = "Move to split down" })
keymap("n", "<leader>wk", "<C-w>k", { desc = "Move to split up" })
keymap("n", "<leader>wl", "<C-w>l", { desc = "Move to split right" })

-- quickfix list
keymap("n", "[q", "<cmd>cprev<cr>", { desc = "Previous quickfix" })
keymap("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix" })

-- move lines
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- pack
keymap("n", "<leader>pu", function() vim.pack.update() end, { desc = "Update plugins" })
keymap("n", "<leader>pl", function() vim.pack.update(nil, { offline = true }) end, { desc = "List plugins" })

-- other
keymap("n", "<leader>wq", "<cmd>write<cr> <cmd>quit<cr>", { desc = "Write and quit" })
keymap("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format buffer" })
keymap("n", "<leader>c", "<cmd>noh<cr>", { desc = "Clear highlights" })
keymap("n", "<leader>[", "<cmd>b#<cr>", { desc = "Jump to last buffer" })
