return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "neo-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup()
  end,
}
