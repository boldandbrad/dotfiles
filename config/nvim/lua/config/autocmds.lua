----------------------------------------------------------------
-- nvim autocmds                                              --
----------------------------------------------------------------

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

autocmd({ "VimEnter", "BufReadPost", "BufEnter" }, {
  desc = "Auto change to project root",
  group = augroup,
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

autocmd("BufWritePre", {
  desc = "Auto-trim trailing whitespace on write",
  group = augroup,
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function() vim.cmd [[%s/\s\+$//e]] end)
    vim.fn.setpos(".", save_cursor)
  end,
})

autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup,
  callback = function()
    vim.highlight.on_yank({ timeout = 170 })
  end
})

autocmd("FileType", {
  desc = "Open help in vertical split",
  pattern = "help",
  command = "wincmd L",
})

autocmd("VimResized", {
  desc = "Auto resize splits on terminal window resize",
  command = "wincmd =",
})

autocmd("FileType", {
  desc = "Do not auto comment on new line",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end
})

autocmd({ "WinEnter", "BufEnter" }, {
  desc = "Enable cursorline in active windows",
  group = augroup,
  callback = function()
    vim.opt_local.cursorline = true
  end
})
autocmd({ "WinLeave", "BufLeave" }, {
  desc = "Disable cursorline in inactive windows",
  group = augroup,
  callback = function()
    vim.opt_local.cursorline = false
  end
})
