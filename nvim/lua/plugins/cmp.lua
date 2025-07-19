return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "dcampos/nvim-snippy",
    "dcampos/cmp-snippy",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local snippy = require("snippy")

    require("snippy").setup({
      mappings = {
        is = {
          ["<Tab>"] = "expand_or_advance",
          ["<S-Tab>"] = "previous",
        },
      },
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          snippy.expand_snippet(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif snippy.can_expand_or_advance() then
            snippy.expand_or_advance()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if snippy.can_jump(-1) then
            snippy.previous()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "snippy" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
