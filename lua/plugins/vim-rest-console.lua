-- vim-rest-console is a REST console integration (like Postman)
-- https://github.com/diepm/vim-rest-console

return {
  'diepm/vim-rest-console',
  keys = {
    { '<leader>p', mode = 'n', '<CMD>call VrcQuery()<CR>', desc = 'rest [p]ostman' },
  },
  init = function()
    vim.g.vrc_set_default_mapping = 0
    vim.g.vrc_response_default_content_type = 'application/json'
    vim.g.vrc_output_buffer_name = '_OUTPUT.json'
    vim.g.vrc_auto_format_response_patterns = { json = 'jq' }
  end,
}
