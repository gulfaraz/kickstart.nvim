-- tailwind-tools is a tailwind integration
-- https://github.com/luckasranarison/tailwind-tools.nvim

return {
  'luckasranarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
    'neovim/nvim-lspconfig',
  },
}
