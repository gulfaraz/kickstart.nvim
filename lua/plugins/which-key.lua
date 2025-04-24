-- which-key shows pending keybinds
-- https://github.com/folke/which-key.nvim

return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup {
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
    }

    require('which-key').add {
      { '<leader>c', group = '[c]ode' },
      { '<leader>l', group = '[l]sp' },
      { '<leader>r', group = '[r]ename' },
      { '<leader>s', group = '[s]earch' },
      { '<leader>w', group = '[w]orkspace' },
      { '<leader>t', group = '[t]oggle' },
      { '<leader>g', group = '[g]it', mode = { 'n', 'v' } },
    }
  end,
}
