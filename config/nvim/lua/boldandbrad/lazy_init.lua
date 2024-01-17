----------------------------------------------------------------
-- lazy.nvim plugin manager install and setup                 --
----------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load plugin specs from plugins/
require("lazy").setup({
  spec = {
    { import = "boldandbrad.plugins" },
  },
  install = {
    colorscheme = { "catppuccin" },
  }
})
