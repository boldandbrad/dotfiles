----------------------------------------------------------------
-- nvim autocmds                                              --
----------------------------------------------------------------

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Define LSP Actions",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- do nothing if there is no lsp client
    if not client then return end

    -- format buffer on write if the client supports it
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format buffer via lsp on write",
        buffer = args.buf,
        callback = function()
          -- format buffer using lsp
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
          -- ensure diagnostics don't get wiped
          vim.diagnostic.enable()
        end,
      })
    end

    -- register lsp keymaps
    local opts = { buffer = args.buf }

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

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Return to last edit position when opening buffer",
  -- group = "bufcheck",
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
