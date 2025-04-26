-- conform is a formatter
-- https://github.com/stevearc/conform.nvim

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    async = false,
    log_level = vim.log.levels.INFO,
    notify_on_error = true,
    format_on_save = function(bufnr)
      if vim.b[bufnr].disable_autoformat then
        return
      end
      return {
        timeout_ms = 1000,
        lsp_format = 'fallback',
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black' },
      php = { 'pint' },
      html = { 'prettierd' },
      typescript = { 'prettierd', 'eslint', 'prettier' },
      ['_'] = { 'prettierd' },
    },
  },
  keys = {
    {
      '<leader>tf',
      mode = { 'n', 'v' },
      function()
        vim.b.disable_autoformat = not vim.b.disable_autoformat
        local message = vim.b.disable_autoformat and 'Disabled' or 'Enabled'
        require 'notify'(message, 'info', { title = 'Format on Save' })
      end,
      desc = '[t]oggle [f]ormat buffer on save',
    },
  },
}
