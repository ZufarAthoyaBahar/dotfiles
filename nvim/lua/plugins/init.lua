return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      -- vim.g.copilot_no_tab_map = false;
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = "  "
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
      vim.api.nvim_set_keymap("i", "<M-c>", "copilot#Accept()", { expr = true, silent = true })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "html", "css", "bash", "lua", "python", "c", "cpp", "csv", "json", "yuck" } },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "vue", "javascript", "typescript", "typescriptreact", "javascriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "goolord/alpha-nvim",
    enabled = true,
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.alpha"
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function()
  --     local opts = require "configs.treesitter"
  --     opts.ensure_installed = { "html", "css", "bash", "lua", "python", "c", "cpp" }
  --     return opts
  --   end
  -- },
}
