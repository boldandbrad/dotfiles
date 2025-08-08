----------------------------------------------------------------
-- nvim autocmds                                              --
----------------------------------------------------------------

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Define LSP Actions",
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto-format buffer on write",
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
          vim.diagnostic.enable() -- ensure diagnostics don't get wiped
        end,
      })
    end

    -- register custom lsp keymaps
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Auto-trim trailing whitespace on write",
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function() vim.cmd [[%s/\s\+$//e]] end)
    vim.fn.setpos(".", save_cursor)
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Return to last edit position when opening buffer",
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.setpos('.', vim.fn.getpos("'\""))
      vim.api.nvim_feedkeys('zz', 'n', true)
    end
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc    = "Start terminal in insert mode",
  group   = vim.api.nvim_create_augroup("custom-term", { clear = true }),
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
