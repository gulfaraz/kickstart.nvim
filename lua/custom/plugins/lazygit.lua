-- lazygit is a lazygit integration
-- https://github.com/kdheepak/lazygit.nvim

return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>gL', '<CMD>LazyGit<CR>', desc = '[g]it [L]azy' },
  },
}
