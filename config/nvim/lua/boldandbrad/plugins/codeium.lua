----------------------------------------------------------------
-- codeium.vim - ai coding assistant                          --
----------------------------------------------------------------

return {
  "Exafunction/codeium.vim",
  init = function()
    vim.g.codeium_no_map_tab = 1
    vim.g.codeium_manual = true
  end,
  keys = {
    { "<C-g>", mode = "i", function() return vim.fn["codeium#Accept"]() end,             expr = true, silent = true },
    { "<c-;>", mode = "i", function() return vim.fn["codeium#CycleOrComplete"]() end,    expr = true, silent = true },
    { "<c-,>", mode = "i", function() return vim.fn["codeium#CycleCompletions"](-1) end, expr = true, silent = true },
    { "<c-x>", mode = "i", function() return vim.fn["codeium#Clear"]() end,              expr = true, silent = true },
  },
}
