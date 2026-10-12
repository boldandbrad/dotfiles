----------------------------------------------------------------
-- nvim language server protocal setup                        --
----------------------------------------------------------------

-- enable lsps -------------------------------------------------
vim.lsp.enable({
  "gopls",
  "lua_ls",
  "marksman",
})

-- apply custom lsp configs ------------------------------------
vim.lsp.config("lua_ls", {
  settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

vim.filetype.add({
  extension = {
    cook = "cooklang",
  }
})
vim.lsp.config("cooklang", {
  cmd = { 'cook', 'lsp' },
  filetypes = { 'cooklang' },
  root_markers = { '.git' },
  -- root_dir = function() return vim.uv.cwd() end,
  settings = {},
})
vim.lsp.enable("cooklang")

-- enable lsp features -----------------------------------------
local autocmd = vim.api.nvim_create_autocmd
autocmd("LspAttach", {
  desc = "Define LSP Actions",
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    -- enable autoformatting on write
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

    -- enable autocompletion
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = true,
        convert = function(item)
          return { abbr = item.label:gsub("%b()", "") }
        end,
      })
      vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "Trigger Autocompletion" })
    end

    -- register custom lsp keymaps
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  end,
})
