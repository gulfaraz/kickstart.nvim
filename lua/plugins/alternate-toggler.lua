-- alternate-toggler allows quick value swap (e.g., true/false)
-- https://github.com/rmagatti/alternate-toggler

return {
  'rmagatti/alternate-toggler',
  event = { 'BufReadPost' },
  opts = {
    alternates = {
      ['private'] = 'public',
      ['enable'] = 'disable',
      ['key'] = 'value',
      ['const'] = 'let',
    },
  },
  keys = {
    { '<leader>ta', mode = 'n', '<CMD>ToggleAlternate<CR>', desc = '[t]oggle [a]lternate' },
  },
}
