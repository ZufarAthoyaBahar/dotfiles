return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    --  "joshdick/onedark.vim",
  },
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      require("onedarkpro").setup({
        theme = "onedark", -- or "deep", "darker"

        italic = true,
        italic_comments = true,
      })
    end,
  },
  {
    'Mofiqul/dracula.nvim',
  },
  {
    'neanias/everforest-nvim',
  },
  {
    'rebelot/kanagawa.nvim',
    'sho-87/kanagawa-paper.nvim',
  },
  {
    'gerardbm/vim-atomic',
  },
  {
    'rose-pine/neovim',
    config = function()
      require('rose-pine').setup({
        dark_variant = 'moon',
      })
    end,
  },
  {
    'shaunsingh/nord.nvim',
  },
  {
    'marko-cerovac/material.nvim',
    config = function()
      vim.g.material_style = "palenight" -- darker, lighter, oceanic, palenight, deep ocean
      require('material').setup({
        contrast = {
          sidebars = true,
          floating_windows = true,
          line_numbers = true,
          sign_column = true,
          cursor_line = true,
          non_current_windows = true,
        },
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
          -- background = "hard" -- can be "dark", "darker", "cool", "deep" or "hard"
        },
      })
    end,
  },
  {
    'oxfist/night-owl.nvim',
  },
  {
    'embark-theme/vim',
  },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        }
      })
    end,
  },
  {
    'vague-theme/vague.nvim',
  },
  {
    'embark-theme/vim',
    name = 'embark',
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.embark_terminal_italics = 1
    end,
  },
  {
    'mellow-theme/mellow.nvim',
  },
  {
    'fynnfluegge/monet.nvim',
  },
  {
    "philosofonusus/morta.nvim",
    name = 'morta',
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'morta'
    end,
  },
}
