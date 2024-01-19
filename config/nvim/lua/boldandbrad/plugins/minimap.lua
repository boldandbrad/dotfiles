return {
  "wfxr/minimap.vim",
  lazy = false,
  init = function()
    vim.g.minimap_width = 12
    vim.g.minimap_auto_start = 1
    vim.g.minimap_close_filetypes = {"alpha", "fugitive", "help"}
  end
}
