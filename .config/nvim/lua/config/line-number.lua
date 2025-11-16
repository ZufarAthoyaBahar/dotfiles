local function highlight_line_numbers()
  local hl     = vim.api.nvim_get_hl

  local number = hl(0, { name = "Number" }).fg or "#89b4fa"
  local bright = hl(0, { name = "Special" }).fg or "#f38ba8"
  local dim    = hl(0, { name = "Comment" }).fg or "#585b70"

  vim.api.nvim_set_hl(0, "LineNr", {
    fg = dim, -- angka pada line number biasa
  })

  vim.api.nvim_set_hl(0, "CursorLineNr", {
    fg = number, -- angka pada cursor line
    bold = true,
  })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = highlight_line_numbers,
})

highlight_line_numbers()
