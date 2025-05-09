-- lazydocker is a lazydocker integration
-- https://github.com/mgierada/lazydocker.nvim

return {
  'mgierada/lazydocker.nvim',
  event = 'VeryLazy',
  dependencies = { 'akinsho/toggleterm.nvim' },
  opts = { border = 'curved' },
  keys = {
    {
      '<leader>td',
      function()
        require('lazydocker').open()
      end,
      desc = '[t]oggle lazy[d]ocker',
    },
  },
}
