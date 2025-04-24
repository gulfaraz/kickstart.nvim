-- todo-comments is used to highlight and search TODO comments
-- https://github.com/folke/todo-comments.nvim

return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
