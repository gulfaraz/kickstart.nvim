vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'exit terminal mode' })

vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'diagnostic [q]uickfix list' })
vim.keymap.set('n', '<leader>Q', function()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd 'cclose'
      return
    end
  end
  vim.cmd 'copen'
end, { desc = 'toggle [Q]uickfix list' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to the upper window' })

vim.keymap.set({ 'n', 'i' }, '<leader>tr', '<CMD>set rnu!<CR>', { desc = '[t]oggle [r]elative line number' })

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

local opts = { noremap = true, silent = true }
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('x', '<leader>p', [["_dP]])

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'json',
  callback = function()
    vim.opt_local.foldmethod = 'indent'
  end,
})
