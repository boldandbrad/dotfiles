return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "folke/lazydev.nvim",
      "rafamadriz/friendly-snippets",
    },
    version = 'v1.*',
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "lazydev" },
        providers = {
          buffer = { enabled = false },
          lsp = { fallbacks = { "lazydev" } },
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" }
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
