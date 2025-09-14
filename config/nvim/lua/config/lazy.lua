----------------------------------------------------------------
-- lazy.nvim plugin manager install and config                --
----------------------------------------------------------------

-- install lazy if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- configure lazy
require("lazy").setup({
  spec = { { import = "plugins" } },
  install = { colorscheme = { "catppuccin" } },
  ui = {
    border = "rounded",
    title = " Plugins ",
  },
  checker = { enabled = true },
})

vim.keymap.set("n", "<leader>P", "<cmd>Lazy home<cr>", { desc = "Open plugin manager" })
