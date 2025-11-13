return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
        signcolumn = "no",
      },
      renderer = {
        root_folder_label = false,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
    })
  end,
}
