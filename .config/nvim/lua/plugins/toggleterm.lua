return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.2
        end
      end,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      direction = "horizontal",
      winbar = { enabled = false },
      persist_size = false,
      present_mode = true,
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        winblend = 10,
        border = "curved",    -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        title = "Terminal",
        title_pos = "center", -- 'left' | 'center' | 'right'
        highlights = {
          background = "Normal",
        },
      },
      on_open = function(term)
        if term.direction == "horizontal" then
          vim.cmd("wincmd J")
        end
      end,

    })
  end,
}
