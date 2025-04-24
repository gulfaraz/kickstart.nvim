-- toggleterm is a terminal integration
-- https://github.com/akinsho/toggleterm.nvim

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      vim.keymap.set({ 'n', 'i' }, '<C-\\>', '<CMD>exe v:count1 . "ToggleTerm size=100 direction=vertical"<CR>'),

      vim.api.nvim_buf_set_keymap(0, 't', '<ESC>', '<C-\\><C-n>', { noremap = true }),
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', '<C-\\><C-n><C-W>k', { noremap = true }),
    }
  end,
}
