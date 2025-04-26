require('lazy').setup({ { import = 'plugins' } }, {
  ui = { border = 'rounded' },
  rocks = { enabled = false }, -- disable rocks to fix error in :checkhealth
})
