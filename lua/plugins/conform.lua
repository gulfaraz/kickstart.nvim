-- conform is a formatter
-- https://github.com/stevearc/conform.nvim

local utils = require 'utils'

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    log_level = vim.log.levels.INFO,
    notify_on_error = true,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if vim.b[bufnr].disable_autoformat or disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 3000,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters = {
      eslint_d = { condition = utils.when_file_matches '^%.?eslint[.r]' },
      stylelint = { condition = utils.when_file_matches '^%.?stylelint[.r]' },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black' },
      php = { 'pint' },
      sql = { 'sqlfmt' },
      javascript = { 'eslint_d', 'prettier', 'prettierd', stop_after_first = true },
      javascriptreact = { 'eslint_d', 'prettier', 'prettierd', stop_after_first = true },
      typescript = { 'eslint_d', 'prettier', 'prettierd', stop_after_first = true },
      typescriptreact = { 'eslint_d', 'prettier', 'prettierd', stop_after_first = true },
      css = { 'stylelint', 'prettier', stop_after_first = true },
      ['_'] = { 'prettier', 'prettierd', stop_after_first = true },
    },
  },
  keys = {
    {
      '<leader>f',
      mode = '',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      desc = '[f]ormat buffer',
    },
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
