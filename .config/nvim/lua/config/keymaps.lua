local map = vim.keymap.set

-- map('n', '<Tab>', ':BufferLineCycleNext <CR>', {})
-- map('n', '<S-Tab>', ':BufferLineCyclePrev <CR>', {})
-- map('n', '<leader>x', ':Bdelete <CR>', { desc = "Close Buffer" })

map('n', '<Tab>', function()
  vim.cmd('BufferLineCycleNext')
end, { desc = "Next Buffer" })

map('n', '<S-Tab>', function()
  vim.cmd('BufferLineCyclePrev')
end, { desc = "Previous Buffer" })

map('n', '<leader>x', function()
  vim.cmd('Bdelete')
end, { desc = "Close Buffer" })

map({ 'n', 'i', 'v' }, '<C-s>', '<ESC><cmd> w <CR>', {})

-- map({ 'n', 't' }, '<A-i>', [[<C-\><C-n>:ToggleTerm 1 direction=float<CR>]], { desc = "Toggle Float Terminal" })
-- map({ 'n', 't' }, '<A-h>', [[<C-\><C-n>:ToggleTerm 2 direction=horizontal<CR>]], { desc = "Toggle Float Horizontal" })
-- map({ 'n', 't' }, '<A-v>', [[<C-\><C-n>:ToggleTerm 3 direction=vertical<CR>]], { desc = "Toggle Float Vertical" })

map({ 'n', 't' }, '<A-i>', function()
  vim.cmd([[exe "ToggleTerm 1 direction=float" | startinsert]])
end, { desc = "Toggle Float Terminal" })

map({ 'n', 't' }, '<A-h>', function()
  vim.cmd([[exe "ToggleTerm 2 direction=horizontal" | startinsert]])
end, { desc = "Toggle Horizontal Terminal" })

map({ 'n', 't' }, '<A-v>', function()
  vim.cmd([[exe "ToggleTerm 3 direction=vertical" | startinsert]])
end, { desc = "Toggle Vertical Terminal" })
