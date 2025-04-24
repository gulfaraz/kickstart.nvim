require('lazy').setup(
  { { import = 'plugins' } },
  { rocks = { enabled = false } } -- disable rocks to fix error in :checkhealth
)
