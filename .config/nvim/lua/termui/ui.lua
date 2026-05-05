local S = require("termui.state")
local Term = require("termui.terminal")

local M = {}

M.win = nil
M.sidebar_buf = nil

local function main_window_config()
  local width  = math.floor(vim.o.columns * 0.75)
  local height = math.floor(vim.o.lines * 0.75)
  local col    = math.floor((vim.o.columns - width) / 2)
  local row    = math.floor((vim.o.lines - height) / 2)

  return {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    border = "rounded",
    style = "minimal",
  }
end

function M.draw_sidebar()
  local lines = {
    " Terminal List",
    "────────────────────",
  }

  for id, t in pairs(S.all()) do
    table.insert(lines, string.format(" [%d] %s", id, t.name))
  end

  vim.api.nvim_buf_set_lines(M.sidebar_buf, 0, -1, false, lines)
end

function M.open()
  if M.win and vim.api.nvim_win_is_valid(M.win) then
    vim.api.nvim_win_close(M.win, true)
  end

  -- Create a main floating window
  local main_buf = vim.api.nvim_create_buf(false, true)
  M.win = vim.api.nvim_open_win(main_buf, true, main_window_config())

  -- Inside this window: create a vertical split
  vim.api.nvim_win_set_option(M.win, "winhl", "Normal:Normal")

  -- Convert this buffer into a split layout
  vim.cmd("vsplit")
  local right_win = vim.api.nvim_get_current_win()

  -- left = sidebar window
  vim.cmd("wincmd h")
  local left_win = vim.api.nvim_get_current_win()

  -- Create sidebar buffer
  M.sidebar_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(left_win, M.sidebar_buf)
  vim.api.nvim_buf_set_option(M.sidebar_buf, "bufhidden", "hide")

  -- Right window is terminal area
  Term.setup(right_win)

  -- Draw sidebar
  M.draw_sidebar()

  -- On Enter: choose terminal
  vim.keymap.set("n", "<CR>", function()
    local line = vim.fn.line(".")
    local text = vim.api.nvim_buf_get_lines(M.sidebar_buf, line - 1, line, false)[1]
    local id = tonumber(text:match("%[(%d+)%]"))
    if id then
      Term.show(id)
      M.draw_sidebar()
    end
  end, { buffer = M.sidebar_buf })
end

return M
