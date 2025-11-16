require("telescope").setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.6,
      },
      -- width = 0.87,
      -- height = 0.80,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {},
})

require("telescope").load_extension("themes")
-- ===========================================================================

-- Dynamic Highlights
local function telescope_highlights()
  local function hl(name)
    return vim.api.nvim_get_hl(0, { name = name }) or {}
  end

  local normal     = hl("Normal")
  local visual     = hl("Visual")
  local string_    = hl("String")
  local error_     = hl("Error")
  local identifier = hl("Identifier")

  local fg         = normal.fg or "#ffffff"
  local bg         = normal.bg or "#000000"
  local bg_alt     = visual.bg or bg
  local green      = string_.fg or fg
  local red        = error_.fg or fg
  local blue       = identifier.fg or fg

  return {
    TelescopeBorder        = { fg = bg_alt, bg = bg },
    TelescopeNormal        = { bg = bg },

    TelescopePreviewBorder = { fg = bg, bg = bg },
    TelescopePreviewNormal = { bg = bg },
    TelescopePreviewTitle  = { fg = bg, bg = green },

    TelescopePromptCounter = { fg = fg, bg = bg_alt },
    TelescopePromptBorder  = { fg = bg_alt, bg = bg_alt },
    TelescopePromptNormal  = { fg = fg, bg = bg_alt },
    TelescopePromptPrefix  = { fg = red, bg = bg_alt },
    TelescopePromptTitle   = { fg = bg, bg = red },

    TelescopeResultsBorder = { fg = bg, bg = bg },
    TelescopeResultsNormal = { bg = bg },
    TelescopeResultsTitle  = { fg = bg, bg = blue },
  }
end

local function apply_telescope_highlights()
  local hls = telescope_highlights()
  for group, spec in pairs(hls) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

vim.api.nvim_create_autocmd("ColorScheme", { -- Apply highlights on colorscheme change
  callback = apply_telescope_highlights,
})

apply_telescope_highlights() -- Apply highlights immediately
-- ===========================================================================

-- Keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files (Telescope)" })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Grep String Under Cursor" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Open Recent Files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep (Search Text)" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "List Open Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Search Help Tags" })
vim.keymap.set('n', '<leader>th', function()
  vim.cmd([[exe "Telescope themes"]])
end, { desc = "Browse Themes" })
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle <CR>', { desc = "Toggle File Explorer" })
vim.keymap.set('n', '<leader>fc', ':CopilotChat <CR>', {})
