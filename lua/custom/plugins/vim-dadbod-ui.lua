-- vim-dadbod-ui is a database integration
-- https://github.com/kristijanhusak/vim-dadbod-ui

return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_winwidth = 80

    vim.keymap.set('n', '<leader>td', '<CMD>:DBUIToggle<CR>', { desc = '[t]oggle [d]atabase' })
  end,
}
