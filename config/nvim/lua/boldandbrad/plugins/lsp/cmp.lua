----------------------------------------------------------------
-- nvim-cmp - autocompletion engine                           --
----------------------------------------------------------------

return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  enabled = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path", -- filesystem path completions
    "windwp/nvim-autopairs",
  },
  init = function()
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- integrate nvim-autopairs
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      },
      enabled = function()
        -- disable completions in comments
        local context = require "cmp.config.context"
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        else
          return not context.in_treesitter_capture("comment")
              and not context.in_syntax_group("Comment")
        end
      end,
      snippet = {
        -- required
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-e>'] = cmp.mapping.abort(),
        -- ['<TAB>'] = cmp.mapping.select_next_item(cmp_select),
        ['<TAB>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            else
              cmp.select_next_item()
            end
          elseif has_words_before() then
            cmp.complete()
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            end
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<S-TAB>'] = cmp.mapping.select_prev_item(cmp_select),
      }),
      experimental = {
        ghost_text = true,
      }
    })
  end,
}
