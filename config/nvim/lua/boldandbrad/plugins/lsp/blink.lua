return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "folke/lazydev.nvim",
      "rafamadriz/friendly-snippets",
    },
    version = 'v0.*',
    enabled = true,
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "lazydev" },
        providers = {
          buffer = { enabled = false },
          lsp = { fallbacks = { "lazydev" } },
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" }
        },
        -- TODO: does this work?
        transform_items = function(ctx, items)
          -- Remove the "Text" source from lsp autocomplete
          return vim.tbl_filter(function(item)
            return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
          end, items)
        end
      },
      completion = {
        accept = {
          auto_brackets = { enabled = true },
        },
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "label", "label_description", gap = 1 }, { "kind" }
            },
          },
        },
        documentation = {
          auto_show = true,
          window = { border = "rounded" },
        },
        ghost_text = { enabled = true },
      },
      keymap = {
        preset = "default",
      },
    },
  }
}
