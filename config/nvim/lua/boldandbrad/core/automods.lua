-- auto trim trailing whitespace on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function() vim.cmd [[%s/\s\+$//e]] end)
    vim.fn.setpos(".", save_cursor)
  end,
})

-- auto format via lsp on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  buffer = bufnr,
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- return to last edit position when opening buffer
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  -- group = "bufcheck",
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.setpos('.', vim.fn.getpos("'\""))
      vim.api.nvim_feedkeys('zz', 'n', true)
    end
  end,
})

-- start terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', {
  -- group   = "bufcheck",
  pattern = "*",
  command = "startinsert | set winfixheight"
})
