local M = {}

M.state = require("termui.state")
M.ui = require("termui.ui")
M.term = require("termui.terminal")

function M.open()
  M.ui.open()
end

function M.new()
  return M.term.create()
end

function M.show(id)
  return M.term.show(id)
end

return M
