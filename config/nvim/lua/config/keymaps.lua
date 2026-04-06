----------------------------------------------------------------
-- nvim global keymaps                                        --
----------------------------------------------------------------

local keymap = vim.keymap.set

-- remap leader to space
keymap("", "<space>", "<Nop>")
vim.g.mapleader = " "

-- window split
keymap("n", "<leader>ws", "<cmd>vsplit<cr>", { desc = "Split window right" })
keymap("n", "<leader>wS", "<cmd>split<cr>", { desc = "Split window below" })
keymap("n", "<leader>w<tab>", "<C-w>w", { desc = "Move to next split" })
keymap("n", "<leader>wh", "<C-w>h", { desc = "Move to split left" })
keymap("n", "<leader>wj", "<C-w>j", { desc = "Move to split below" })
keymap("n", "<leader>wk", "<C-w>k", { desc = "Move to split above" })
keymap("n", "<leader>wl", "<C-w>l", { desc = "Move to split right" })

-- quickfix list
keymap("n", "[q", "<cmd>cprev<cr>", { desc = "Previous quickfix" })
keymap("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix" })

-- line
-- ctrl+alt is used to avoid conflict with aerospace focus
keymap("n", "<CA-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap("n", "<CA-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
keymap("i", "<CA-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
keymap("i", "<CA-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
keymap("v", "<CA-j>", "<cmd>m '>+1<cr>gv=gv", { desc = "Move selection down" })
keymap("v", "<CA-k>", "<cmd>m '<-2<cr>gv=gv", { desc = "Move selection up" })
keymap("v", "<", "<gv", { desc = "Indent left and keep selection" })
keymap("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- pack
keymap("n", "<leader>pu", function() vim.pack.update() end, { desc = "Update plugins" })
keymap("n", "<leader>pl", function() vim.pack.update(nil, { offline = true }) end, { desc = "List plugins" })

-- buffer
keymap("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Jump to previous buffer" })
keymap("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Jump to next buffer" })
keymap("n", "<leader>bl", "<cmd>b#<cr>", { desc = "Jump to last buffer" })
keymap("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format buffer" })

-- other
keymap("n", "<leader>c", "<cmd>noh<cr>", { desc = "Clear highlights" })
