----------------------------------------------------------------
-- nvim automods                                              --
----------------------------------------------------------------

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Define LSP Action mappings",
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
    vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Auto trim trailing whitespace on write",
  pattern = { "*" },
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function() vim.cmd [[%s/\s\+$//e]] end)
    vim.fn.setpos(".", save_cursor)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Auto format buffer via lsp on write",
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- auto-session handles this
-- -- return to last edit position when opening buffer
-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
--   -- group = "bufcheck",
--   pattern = "*",
--   callback = function()
--     if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
--       vim.fn.setpos('.', vim.fn.getpos("'\""))
--       vim.api.nvim_feedkeys('zz', 'n', true)
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Start terminal in insert mode",
  -- group   = "bufcheck",
  pattern = "*",
  command = "startinsert | set winfixheight"
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})
