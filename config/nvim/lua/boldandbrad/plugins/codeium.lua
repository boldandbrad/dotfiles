----------------------------------------------------------------
-- codeium.vim - ai coding assistant                          --
----------------------------------------------------------------

return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function()
    vim.g.codeium_no_map_tab = 1
    vim.g.codeium_manual = true
    -- Change "<C-g>" here to any keycode you like.
    vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
    vim.keymap.set("i", "<c-;>", function() return vim.fn["codeium#CycleOrComplete"]() end,
      { expr = true, silent = true })
    vim.keymap.set("i", "<c-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end,
      { expr = true, silent = true })
    vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
  end
}
