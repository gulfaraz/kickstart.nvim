-- todo-comments is used to highlight and search TODO comments
-- https://github.com/folke/todo-comments.nvim

return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false,
    keywords = {
      REFACTOR = { icon = '🛠️', color = 'warning' },
    },
  },
  keys = {
    {
      ']t',
      mode = 'n',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'next [t]odo',
    },
    {
      '[t',
      mode = 'n',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'prev [t]odo',
    },
    {
      '<leader>st',
      '<CMD>TodoTelescope<CR>',
      desc = '[s]earch [t]odos',
    },
  },
}
