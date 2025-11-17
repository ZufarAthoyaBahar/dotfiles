local map = vim.keymap.set

-- Buffer navigation
map('n', '<Tab>', function()
  vim.cmd('BufferLineCycleNext')
end, { desc = "Next Buffer" })

map('n', '<S-Tab>', function()
  vim.cmd('BufferLineCyclePrev')
end, { desc = "Previous Buffer" })

map('n', '<leader>x', function()
  vim.cmd('Bdelete')
end, { desc = "Close Buffer" })

-- save with Ctrl+s in normal, insert and visual mode
map({ 'n', 'i', 'v' }, '<C-s>', '<ESC><cmd> w <CR>', {})
-- jk to escape from insert module
map('i', 'jk', '<ESC>', { desc = "Escape Insert Mode" })

-- Improved terminal toggling to start in insert mode
map({ 'n', 't' }, '<A-i>', function()
  vim.cmd([[exe "ToggleTerm 1 direction=float" | startinsert]])
end, { desc = "Toggle Float Terminal" })

map({ 'n', 't' }, '<A-h>', function()
  vim.cmd([[exe "ToggleTerm 2 direction=horizontal" | startinsert]])
end, { desc = "Toggle Horizontal Terminal" })

map({ 'n', 't' }, '<A-v>', function()
  vim.cmd([[exe "ToggleTerm 3 direction=vertical" | startinsert]])
end, { desc = "Toggle Vertical Terminal" })
