return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "andrew-george/telescope-themes" },
  config = function()
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("themes")
  end,
}
