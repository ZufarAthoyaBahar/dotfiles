local bufferline = require("bufferline")

require("bufferline").setup({
  options = {
    style_preset = bufferline.style_preset.no_italic,
    themeable = true,
    close_command = "Bdelete! %d",
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = true,
    show_close_icon = true,
    buffer_close_icon = '󰅙 ',
    left_trunc_marker = ' ',
    right_trunc_marker = ' ',
    indicator = {
      style = 'underline',
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
  highlights = {
    fill = {
      bg = "#1E2127",
    },
    close_button = {
      fg = "#e55561",
    },
    close_button_visible = {
      fg = "#e55561",
    },
    close_button_selected = {
      fg = "#e55561",
    },
  },
})
