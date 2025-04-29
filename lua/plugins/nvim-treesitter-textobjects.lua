-- nvim-nvim-treesitter-textobjects allows syntax aware text objects
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ic = '@comment.inner',
            ac = '@comment.outer',
          },
        },
      },
    },
  },
}
