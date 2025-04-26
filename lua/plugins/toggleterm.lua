-- toggleterm is a terminal integration
-- https://github.com/akinsho/toggleterm.nvim

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  keys = {
    { '<C-\\>', mode = { 'n', 'i' }, '<CMD>exe v:count1 . "ToggleTerm size=100 direction=vertical"<CR>', desc = 'ToggleTerm' },
  },
}
