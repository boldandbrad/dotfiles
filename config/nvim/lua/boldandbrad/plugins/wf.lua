return {
  "Cassin01/wf.nvim",
  version = "*",
  config = function()
    require("wf").setup()

    local buffer = require("wf.builtin.buffer")
    vim.keymap.set(
      "n",
      "<Space>wbu",
      -- buffer(opts?: table) -> function
      -- opts?: option
      buffer(),
      { noremap = true, silent = true, desc = "[wf.nvim] buffer" }
    )


    local which_key = require("wf.builtin.which_key")
    vim.keymap.set(
      "n",
      "<leader><leader>",
      -- mark(opts?: table) -> function
      -- opts?: option
      which_key({ text_insert_in_advance = "<Space>" }),
      { noremap = true, silent = true, desc = "WF which-key", nowait = true }
    )
  end
}
