local M = {}

M.next_id = 1
M.items = {}

function M.new()
  local id = M.next_id
  M.next_id = id + 1

  M.items[id] = {
    id = id,
    name = "Terminal " .. id,
    buf = nil,
    job = nil,
  }

  return id, M.items[id]
end

function M.get(id)
  return M.items[id]
end

function M.all()
  return M.items
end

return M
