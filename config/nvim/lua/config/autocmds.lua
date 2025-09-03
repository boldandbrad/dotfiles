----------------------------------------------------------------
-- nvim autocmds                                              --
----------------------------------------------------------------

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local prj_root_group = augroup("ProjectRoot", { clear = true })
autocmd({ "VimEnter", "BufReadPost", "BufEnter" }, {
  desc = "Auto change to project root",
  group = prj_root_group,
  pattern = "*",
  callback = function()
    local root_patterns = { ".git", "go.mod", "deno.json", "Cargo.toml", "pyproject.toml" }
    local current_dir = vim.fn.expand("%:p:h")

    local root_found = false
    while not root_found do
      local is_root = false
      for _, root_pattern in ipairs(root_patterns) do
        if vim.fn.glob(current_dir .. "/" .. root_pattern) ~= "" then
          is_root = true
        end
      end

      if is_root then
        root_found = true
      elseif current_dir == "/" then
        break
      else
        current_dir = vim.fn.fnamemodify(current_dir, ":h")
      end

      if root_found then
        if current_dir == vim.fn.getcwd() then
          return
        else
          vim.cmd("cd " .. current_dir)
          vim.notify("Changed to project root: " .. current_dir)
        end
      end
    end
  end
})

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
