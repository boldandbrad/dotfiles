----------------------------------------------------------------
-- Comment.nvim - comment/uncomment motions                   --
----------------------------------------------------------------

return {
  'numToStr/Comment.nvim',
  opts = {},
  config = function()
    require("Comment").setup()
  end
}
