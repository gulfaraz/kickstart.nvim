-- nvim-treesitter is used to highlight, edit, and navigate code
-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      'bash',
      'lua',
      'luadoc',
      'vim',
      'vimdoc',
      'markdown',
      'markdown_inline',
      'query',
      'javascript',
      'typescript',
      'angular',
      'html',
      'css',
      'scss',
      'python',
      'php',
      'sql',
      'nginx',
      'regex',
      'json',
      'yaml',
      'diff',
      'gitignore',
      'editorconfig',
      'ssh_config',
    },
    auto_install = true,
    highlight = {
      enable = true,
      disable = { 'csv' }, -- use rainbow-csv for csv
    },
    indent = { enable = true },
  },
}
