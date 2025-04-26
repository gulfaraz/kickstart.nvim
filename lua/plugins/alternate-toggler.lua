-- alternate-toggler allows quick value swap (e.g., true/false)
-- https://github.com/rmagatti/alternate-toggler

return {
  'rmagatti/alternate-toggler',
  event = { 'BufReadPost' },
  keys = {
    { '<leader>ta', mode = 'n', '<CMD>:ToggleAlternate<CR>', desc = '[t]oggle [a]lternate' },
  },
}
