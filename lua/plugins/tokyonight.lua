-- tokyonight is a color scheme
-- https://github.com/folke/tokyonight.nvim

return {
  'folke/tokyonight.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'tokyonight-night'
    vim.cmd.hi 'Comment gui=none'
    vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 0, bg = '#292e42' })
  end,
}
