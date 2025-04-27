-- indent-blankline adds indentation guides
-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = { highlight = 'Whitespace', char = '.' },
    whitespace = {
      highlight = {
        'Whitespace',
        'CursorColumn',
      },
      remove_blankline_trail = false,
    },
    scope = { enabled = false },
  },
}
