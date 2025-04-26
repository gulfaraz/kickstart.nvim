-- vim-dadbod-ui is a database integration
-- https://github.com/kristijanhusak/vim-dadbod-ui

return {
  'kristijanhusak/vim-dadbod-ui',
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', lazy = true, ft = { 'sql', 'mysql', 'plsql' } },
  },
  keys = {
    { '<leader>td', mode = 'n', '<CMD>:DBUIToggle<CR>', desc = '[t]oggle [d]atabase' },
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_winwidth = 80
  end,
}
