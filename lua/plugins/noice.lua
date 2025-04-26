-- noice replaces the UI for messages, cmdline, and popupmenu
-- https://github.com/folke/noice.nvim

return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    routes = {
      {
        view = 'notify',
        filter = { event = 'msg_showmode' },
      },
    },
    views = {
      notify = { title = 'Messages' },
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    presets = {
      long_message_to_split = true, -- long messages will be sent to a split
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
    'hrsh7th/nvim-cmp',
  },
  init = function()
    local macro_group = vim.api.nvim_create_augroup('MacroRecording', { clear = true })
    vim.api.nvim_create_autocmd('RecordingLeave', {
      group = macro_group,
      callback = function()
        -- Display a message when macro recording stops
        print 'Macro recording stopped'
      end,
    })
    -- keymap to dismiss noice
    vim.keymap.set('n', '<leader>d', '<CMD>NoiceDismiss<CR>', { desc = 'noice [d]ismiss' })
    -- Load telescope extension
    require('telescope').load_extension 'noice'
  end,
}
