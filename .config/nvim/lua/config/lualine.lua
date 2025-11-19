local colors = {
  blue = "#61afef",
  fg = "#abb2bf",
  bg = "#282c34",
  green = "#8ebd6b",
  yellow = "#e2b86b",
  purple = "#bf68d9",
  orange = "#cc9057",
  peanut = "#f6d5a4",
  red = "#e55561",
  aqua = "#61afef",
  darkblue = "#282c34",
  dark_red = "#8b3434",
}

-- local mytheme = {
--   normal = {
--     a = { fg = colors.green, bg = colors.bg },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.white },
--   },
--
--
--   inactive = {
--     a = { fg = colors.blue, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.white },
--   },
-- }

require('lualine').setup({
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    -- left
    lualine_a = {
      {
        function()
          return ""
        end,
        -- color = function()
        --   local mode_color = {
        --     n = { fg = colors.green, bg = colors.bg, gui = 'bold' },  -- Normal
        --     i = { fg = colors.blue, bg = colors.bg, gui = 'bold' },   -- Insert
        --     v = { fg = colors.purple, bg = colors.bg, gui = 'bold' }, -- Visual
        --     V = { fg = colors.peanut, bg = colors.bg, gui = 'bold' }, -- Visual Line
        --     c = { fg = colors.red, bg = colors.bg, gui = 'bold' },    -- Command
        --     R = { fg = colors.red, bg = colors.bg, gui = 'bold' },    -- Replace
        --   }
        --   return mode_color[vim.fn.mode()] or { fg = colors.green, bg = colors.bg }
        -- end,
        separator = { left = '', right = '' },
        padding = { left = 1, right = 0 },
      },
      {
        'mode',
        -- color = function()
        --   local mode_color = {
        --     n = { fg = colors.green, bg = colors.bg, gui = 'bold' },  -- Normal
        --     i = { fg = colors.blue, bg = colors.bg, gui = 'bold' },   -- Insert
        --     v = { fg = colors.purple, bg = colors.bg, gui = 'bold' }, -- Visual
        --     V = { fg = colors.peanut, bg = colors.bg, gui = 'bold' }, -- Visual Line
        --     c = { fg = colors.red, bg = colors.bg, gui = 'bold' },    -- Command
        --     R = { fg = colors.red, bg = colors.bg, gui = 'bold' },    -- Replace
        --   }
        --   return mode_color[vim.fn.mode()] or { fg = colors.green, bg = colors.bg }
        -- end,
      },
    },
    lualine_b = {
      { 'branch',
        -- color = {
        --   fg = colors.purple, gui = 'bold'
        -- }
      },
      {
        'diff',
        symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
        -- colored = true,
        -- diff_color = {
        --   added = { fg = colors.green },
        --   modified = { fg = colors.orange },
        --   removed = { fg = colors.red },
        -- },

      }, 'diagnostics' },
    lualine_c = { { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 }, }, {
      'filename',
      icons_enabled = true,
      path = 1,
      padding = 0,
      -- color = {
      --   fg = colors.blue
      -- }
    } },

    -- right
    lualine_x = {
      {
        function()
          local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
          if next(buf_clients) == nil then
            return '' -- tidak ada LSP aktif
          end

          local names = {}
          for _, client in pairs(buf_clients) do
            table.insert(names, client.name)
          end
          return '  ' .. table.concat(names, ' | ')
        end,
        -- color = { fg = colors.fg, gui = 'bold' },
      },
      -- {
      --   'g:zoom#statustext',
      --   icon = ' ',
      --   -- color = { fg = colors.peanut },
      -- },
      -- {
      --   'encoding',
      --   -- color = { fg = colors.yellow }
      -- },
      -- {
      --   'fileformat',
      --   -- color = { fg = colors.yellow },
      -- },
      {
        'filetype',
        icon_only = false,
        colored = true, -- different colors for different filetypes
        icon = ' ',
        -- color = { fg = colors.blue },
      },
    },
    lualine_y = {
      {
        'location',
        icon = '',
        -- color = function()
        --   local mode_color = {
        --     n = { fg = colors.green, bg = colors.bg, gui = 'bold' },  -- Normal
        --     i = { fg = colors.blue, bg = colors.bg, gui = 'bold' },   -- Insert
        --     v = { fg = colors.purple, bg = colors.bg, gui = 'bold' }, -- Visual
        --     V = { fg = colors.peanut, bg = colors.bg, gui = 'bold' }, -- Visual Line
        --     c = { fg = colors.red, bg = colors.bg, gui = 'bold' },    -- Command
        --     R = { fg = colors.red, bg = colors.bg, gui = 'bold' },    -- Replace
        --   }
        --   return mode_color[vim.fn.mode()] or { fg = colors.green, bg = colors.bg }
        -- end,
      },
    },
    lualine_z = {
      {
        'progress',
        -- color = function()
        --   local mode_color = {
        --     n = { fg = colors.green, bg = colors.bg, gui = 'bold' },  -- Normal
        --     i = { fg = colors.blue, bg = colors.bg, gui = 'bold' },   -- Insert
        --     v = { fg = colors.purple, bg = colors.bg, gui = 'bold' }, -- Visual
        --     V = { fg = colors.peanut, bg = colors.bg, gui = 'bold' }, -- Visual Line
        --     c = { fg = colors.red, bg = colors.bg, gui = 'bold' },    -- Command
        --     R = { fg = colors.red, bg = colors.bg, gui = 'bold' },    -- Replace
        --   }
        --   return mode_color[vim.fn.mode()] or { fg = colors.green, bg = colors.bg }
        -- end,
        padding = { left = 0, right = 1 }
      },
    },
  },
  extensions = { 'quickfix', 'fugitive', 'fzf' },
})
