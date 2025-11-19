local M = {}

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true

-- =========================
-- Palette
-- =========================
local colors = {
  background         = "#1E1B30",
  background_light   = "#27273C",
  background_lighter = "#2E2A42",
  foreground         = "#E8E6EF",
  fg_dim             = "#C3C0CF",
  fg_muted           = "#A29FAD",

  primary            = "#88AEEB", -- function
  accent             = "#E8D8A8", -- type
  secondary          = "#5A637A", -- comment / UI

  -- KELOMPOK HIJAU & TEAL
  green_mint         = "#A4D8B5",
  green_sage         = "#8EB29C",
  green_moss         = "#7E9E83",
  teal_pudar         = "#87D1C0",
  seafoam            = "#B3E5E1",

  -- KELOMPOK BIRU
  cyan_langit        = "#8AD7E3",
  blue_denim         = "#6BA2C8",
  blue_nordic        = "#81A1C1",
  blue_steel         = "#5E81AC",
  blue_ice           = "#E5E9F0",

  -- KELOMPOK UNGU & PINK
  magenta_anggrek    = "#D7A6D8",
  purple_lavender    = "#C4A7E7",
  purple_mauve       = "#C6A0F6",
  indigo_gelap       = "#959DBD",
  pink_sakura        = "#F5C2E7",

  -- KELOMPOK MERAH & ORANYE
  orange_aprikot     = "#E7A974",
  red_soft           = "#E89A9F",
  red_crimson        = "#E06C75",
  peach              = "#F5C2A5",
  clay               = "#D08F70",
  salmon             = "#EE99A0",

  -- KELOMPOK KUNING & COKELAT
  yellow_sand        = "#D9C7A3",
  gold_muted         = "#EBCB8B",
  wheat              = "#E5D6AC",
  brown_wood         = "#A38C75",

  -- KELOMPOK MONOKROM (UI & Background)
  grey_lavender      = "#CFCEDB",
  fg_cloud           = "#DCDFE4",
  fg_comment_storm   = "#5C6370",
  bg_charcoal        = "#2A2F38",
  bg_night           = "#232831",

  error              = "#E06C75",
  warning            = "#E5C98A",
  info               = "#7FB3D5",
  success            = "#A4D8B5",

}

local function darken(hex, amount)
  local r = tonumber(hex:sub(2, 3), 16)
  local g = tonumber(hex:sub(4, 5), 16)
  local b = tonumber(hex:sub(6, 7), 16)

  local function mix(v)
    return math.floor(v * (1 - amount))
  end

  return string.format("#%02X%02X%02X", mix(r), mix(g), mix(b))
end

local rainbow = {
  "#E06C75",
  "#E7A974",
  "#D9C7A3",
  "#A4D8B5",
  "#6BA2C8",
  "#C4A7E7",
}

-- =========================
-- Helper function
-- =========================
local function set(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- =======================h=
-- Non-Treesitter Highlights
-- =========================
set("Normal", { fg = colors.foreground, bg = colors.background })
set("Comment", { fg = colors.secondary, italic = true })

set("Constant", { fg = colors.magenta_anggrek })
set("String", { fg = colors.green_mint })
set("Number", { fg = colors.cyan_langit })
set("Boolean", { fg = colors.cyan_langit })

set("Identifier", { fg = colors.fg_dim })
set("Function", { fg = colors.salmon })

set("Statement", { fg = colors.orange_aprikot, bold = true })
set("PreProc", { fg = colors.accent })
set("Type", { fg = colors.accent })

set("Special", { fg = colors.cyan_langit })
set("Underlined", { fg = colors.primary, underline = true })

-- Messages
set("Error", { fg = colors.error, bg = colors.background_light, bold = true })
set("WarningMsg", { fg = colors.warning, bg = colors.background_light, bold = true })
set("InfoMsg", { fg = colors.info, bg = colors.background_light, bold = true })
set("SuccessMsg", { fg = colors.success, bg = colors.background_light, bold = true })

-- UI Elements
set("Visual", { bg = colors.background_lighter })
set("CursorLine", { bg = colors.background_lighter })
set("CursorColumn", { bg = colors.background_lighter })

set("StatusLine", { fg = colors.foreground, bg = "#1C1622", bold = true })
set("StatusLineNC", { fg = colors.foreground, bg = "#120D17" })

-- Popup menu
set("Pmenu", { fg = colors.foreground, bg = "#1A1623" })
set("PmenuSel", { fg = colors.background, bg = colors.primary })
set("PmenuSbar", { bg = "#1C1828" })
set("PmenuThumb", { bg = colors.primary })

-- Line numbers
set("LineNr", { fg = "#4C435E" })
set("CursorLineNr", { fg = colors.primary, bold = true })

-- Search
set("Search", { fg = colors.background, bg = colors.orange_aprikot, bold = true })
set("IncSearch", { fg = colors.background, bg = colors.accent, bold = true })

-- Diff
set("DiffAdd", { bg = "#1D2A23" })
set("DiffChange", { bg = "#2A2638" })
set("DiffDelete", { fg = colors.error, bg = "#2A1F25" })
set("DiffText", { bg = "#3A3450" })

-- Diagnostics
set("DiagnosticError", { fg = colors.error, bg = colors.background_light })
set("DiagnosticWarn", { fg = colors.warning, bg = colors.background_light })
set("DiagnosticInfo", { fg = colors.info, bg = colors.background_light })
set("DiagnosticHint", { fg = colors.green_mint, bg = colors.background_light })

set("DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
set("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warning })
set("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
set("DiagnosticUnderlineHint", { undercurl = true, sp = colors.green_mint })

-- =========================
-- Treesitter Highlights
-- =========================
set("@comment", { fg = colors.secondary, italic = true })
set("@comment.documentation", { fg = colors.fg_muted })

set("@constant", { fg = colors.magenta_anggrek })
set("@constant.builtin", { fg = colors.red_crimson })
set("@constant.macro", { fg = colors.magenta_anggrek, bold = true })

set("@string", { fg = colors.green_mint })
set("@string.regex", { fg = colors.teal_pudar })
set("@string.escape", { fg = colors.orange_aprikot })
set("@string.special", { fg = colors.cyan_langit })

set("@character", { fg = colors.green_mint })
set("@number", { fg = colors.orange_aprikot })
set("@boolean", { fg = colors.cyan_langit })
set("@float", { fg = colors.cyan_langit })

set("@identifier", { fg = colors.fg_dim })
set("@variable", { fg = colors.grey_lavender, italic = true })
set("@variable.builtin", { fg = colors.orange_aprikot, italic = true })
set("@variable.parameter", { fg = colors.brown_wood })
set("@variable.member", { fg = colors.yellow_sand })

set("@field", { fg = colors.peach })
set("@property", { fg = colors.peach })

set("@function", { fg = colors.purple_lavender })
set("@function.builtin", { fg = colors.purple_lavender })
set("@function.call", { fg = colors.purple_lavender })
set("@method", { fg = colors.blue_nordic })
set("@method.call", { fg = colors.blue_nordic })

set("@constructor", { fg = colors.teal_pudar })
set("@namespace", { fg = colors.teal_pudar, italic = true })

set("@operator", { fg = colors.cyan_langit })
set("@keyword", { fg = colors.blue_steel, bold = true })
set("@keyword.function", { fg = colors.orange_aprikot, italic = true })
set("@keyword.operator", { fg = colors.cyan_langit })
set("@keyword.return", { fg = colors.red_crimson })

set("@type", { fg = colors.teal_pudar })
set("@type.builtin", { fg = colors.accent, italic = true })
set("@type.definition", { fg = colors.cyan_langit })

set("@tag", { fg = colors.magenta_anggrek })
set("@tag.attribute", { fg = colors.yellow_sand })
set("@tag.delimiter", { fg = colors.secondary })

set("@punctuation.bracket", { fg = colors.fg_muted })
set("@punctuation.delimiter", { fg = colors.fg_muted })
set("@punctuation.special", { fg = colors.cyan_langit })

set("@symbol", { fg = colors.magenta_anggrek })

-- =========================
-- Floating Windows
-- =========================
set("NormalFloat", { bg = colors.background_light }) -- background helper
set("FloatBorder", { fg = colors.blue_steel, bg = colors.background_light })

-- =========================
-- Nvim Tree
-- =========================
-- Name colors
set("NvimTreeNormal", { fg = colors.grey_lavender, bg = colors.background })
set("NvimTreeFolderName", { fg = colors.purple_lavender })
set("NvimTreeOpenedFolderName", { fg = colors.purple_lavender, bold = true })
set("NvimTreeEmptyFolderName", { fg = colors.secondary })
set("NvimTreeFileName", { fg = colors.foreground })
set("NvimTreeImageFile", { fg = colors.cyan_langit })
set("NvimTreeSpecialFile", { fg = colors.accent, underline = true })
-- Git status
set("NvimTreeGitFileIgnoredHL", { fg = colors.bg_charcoal })
set("NvimTreeGitFileIgnoredHL", { fg = colors.bg_charcoal })
set("NvimTreeGitIgnoredIcon", { fg = colors.yellow_sand })
set("NvimTreeGitFileNewHL", { fg = colors.green_mint })
set("NvimTreeGitDirty", { fg = colors.orange_aprikot })
set("NvimTreeGitNewIcon", { fg = colors.green_mint })
set("NvimTreeGitDeletedIcon", { fg = colors.error })
set("NvimTreeGitRenamedIcon", { fg = colors.error })
set("NvimTreeGitStagedIcon", { fg = colors.success })
set("NvimTreeGitMergeIcon", { fg = colors.info })
-- Icons
set("NvimTreeFolderIcon", { fg = colors.purple_lavender })
set("NvimTreeOpenedFolderIcon", { fg = colors.purple_lavender })

-- =========================
-- Render Markdown
-- =========================
set("RenderMarkdownCode", { bg = colors.background_light })
set("RenderMarkdownCodeBlock", { fg = colors.green_mint, bg = colors.background_light })
-- set("RenderMarkdownQuote", { fg = colors.background_light, italic = true })
set("RenderMarkdownCodeInline", { bg = colors.background_light })
set("@markup.strong.markdown_inline", { fg = colors.peach, bold = true })
set("@markup.italic.markdown_inline", { fg = colors.red_crimson, italic = true })
-- set("RenderMarkdownLink", { fg = colors.cyan_langit, undercurl = true })
-- set("RenderMarkdownH1Bg", { fg = colors.red_crimson, bg = colors.background_light, bold = true })
-- set("RenderMarkdownH2Bg", { fg = colors.orange_aprikot, bg = colors.background_light, bold = true })
-- set("RenderMarkdownH3Bg", { fg = colors.yellow_sand, bg = colors.background_light, bold = true })
-- set("RenderMarkdownH4Bg", { fg = colors.green_mint, bg = colors.background_light, bold = true })
-- set("RenderMarkdownH5Bg", { fg = colors.blue_denim, bg = colors.background_light, bold = true })
-- set("RenderMarkdownH6Bg", { fg = colors.purple_lavender, bg = colors.background_light, bold = true })

for i = 1, 6 do
  local color = rainbow[i]

  -- heading text
  set("RenderMarkdownH" .. i, {
    fg = color,
    bold = true,
  })

  -- heading background “transparan/pudar”
  set("RenderMarkdownH" .. i .. "Bg", {
    bg = darken(color, 0.70),
  })
end
-- =========================
-- Return module
-- =========================

vim.g.colors_name = "mycolors"

M.colors = colors
M.set = set
return M
