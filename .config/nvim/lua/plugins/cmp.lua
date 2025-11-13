return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",    -- Integrasi LSP
    "hrsh7th/cmp-buffer",      -- Sumber dari buffer
    "hrsh7th/cmp-path",        -- Sumber dari path
    "hrsh7th/cmp-cmdline",     -- Sumber dari command line
    "L3MON4D3/LuaSnip",        -- Engine snippet (opsional)
    "saadparwaiz1/cmp_luasnip" -- Snippet source
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end
}
