local S = require("termui.state")

local M = {}

M.win = nil

function M.setup(win)
  M.win = win
end

function M.show(id)
  local t = S.get(id)
  if not t then return end

  -- Create buffer if needed
  if not t.buf or not vim.api.nvim_buf_is_valid(t.buf) then
    t.buf = vim.api.nvim_create_buf(false, true)
    t.job = vim.fn.termopen(vim.o.shell)
    vim.api.nvim_buf_set_option(t.buf, "bufhidden", "hide")
  end

  -- set buffer into right split
  vim.api.nvim_win_set_buf(M.win, t.buf)

  vim.cmd("startinsert")
end

function M.create()
  local id = S.new()
  M.show(id)
  return id
end

return M
