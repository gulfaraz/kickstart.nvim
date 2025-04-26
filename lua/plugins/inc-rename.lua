-- inc-rename provies visual feedback for LSP rename
-- https://github.com/smjonas/inc-rename.nvim

return {
  'smjonas/inc-rename.nvim',
  opts = {},
  keys = {
    { '<leader>lr', mode = 'n', ':IncRename ', desc = '[l]sp [r]ename' },
  },
}
