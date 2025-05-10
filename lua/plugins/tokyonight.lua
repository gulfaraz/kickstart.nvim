-- tokyonight is a color scheme
-- https://github.com/folke/tokyonight.nvim

return {
  'folke/tokyonight.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    styles = {
      comments = { italic = false }, -- disable italics in comments
    },
  },
  init = function()
    vim.cmd.colorscheme 'tokyonight-night'
    vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 0, bg = '#292e42' })
  end,
  keys = {
    {
      '<leader>tc',
      mode = 'n',
      function()
        if vim.g.colors_name == 'tokyonight-night' then
          vim.cmd.colorscheme 'tokyonight-day'
          vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 0, bg = '#c4c8da' })
        else
          vim.cmd.colorscheme 'tokyonight-night'
          vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 0, bg = '#292e42' })
        end
      end,
      desc = '[t]oggle [c]olourscheme',
    },
  },
}
