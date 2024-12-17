----------------------------------------------------------------
-- illuminate - auto highlight instances of current word      --
----------------------------------------------------------------

return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      delay = 100,
      filetypes_denylist = {
        "TelescopePrompt",
      }
    })
  end
}
