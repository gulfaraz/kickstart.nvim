-- alternate-toggler allows quick value swap (e.g., true/false)
-- https://github.com/rmagatti/alternate-toggler

return {
  'rmagatti/alternate-toggler',
  config = function()
    require('alternate-toggler').setup {}

    vim.keymap.set('n', '<leader>ta', '<CMD>:ToggleAlternate<CR>', { desc = '[t]oggle [a]lternate' })
  end,
  event = { 'BufReadPost' },
}
