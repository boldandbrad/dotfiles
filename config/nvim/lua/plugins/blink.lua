----------------------------------------------------------------
-- blink.cmp - completion engine                              --
----------------------------------------------------------------

return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = 'v1.*',
    opts = {
      sources = {
        default = { "lsp", "path", "snippets" },
        providers = {
          buffer = { enabled = false },
        },
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 }, { "kind" }
            },
          },
        },
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
      },
      signature = { enabled = true },
      keymap = { preset = "default" },
    },
  }
}
