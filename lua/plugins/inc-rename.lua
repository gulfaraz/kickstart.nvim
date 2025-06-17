-- inc-rename provies visual feedback for LSP rename
-- https://github.com/smjonas/inc-rename.nvim

return {
  'smjonas/inc-rename.nvim',
  enabled = false,
  opts = {},
  keys = {
    { 'grn', mode = 'n', ':IncRename ', desc = 'LSP: [r]ename' },
  },
}
