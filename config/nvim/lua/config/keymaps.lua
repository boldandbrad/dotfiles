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
keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete current buffer" })

-- lazygit (courtesy of https://github.com/zachbuchli/lazygit.nvim)
keymap("n", "<leader>G", function()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

  local height = math.ceil(vim.o.lines * 0.9)
  local width = math.ceil(vim.o.columns * 0.9)
  local win = vim.api.nvim_open_win(buf, true, {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = math.ceil((vim.o.lines - height) / 2),
    col = math.ceil((vim.o.columns - width) / 2),
    border = "none",
  })
  vim.api.nvim_set_current_win(win)

  vim.fn.termopen({ "lazygit" }, {
    on_exit = function(_, _, _)
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })

  vim.cmd.startinsert()
end, { desc = "Open lazygit" })

-- other
keymap("n", "<leader>c", "<cmd>noh<cr>", { desc = "Clear highlights" })
