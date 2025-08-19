----------------------------------------------------------------
-- nvim autocmds                                              --
----------------------------------------------------------------

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("LspAttach", {
  desc = "Define LSP Actions",
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method("textDocument/formatting") then
      autocmd("BufWritePre", {
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

local trim_group = augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  desc = "Auto-trim trailing whitespace on write",
  group = trim_group,
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function() vim.cmd [[%s/\s\+$//e]] end)
    vim.fn.setpos(".", save_cursor)
  end,
})

local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = highlight_group,
  callback = function()
    vim.highlight.on_yank({ timeout = 170 })
  end
})
