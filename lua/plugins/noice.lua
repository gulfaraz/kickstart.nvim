-- noice replaces the UI for messages, cmdline, and popupmenu
-- https://github.com/folke/noice.nvim

return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
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
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
      },
    },
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
      cmdline_output_to_split = false, -- opens cmdline output in a split
    },
  },
  init = function()
    local macro_group = vim.api.nvim_create_augroup('MacroRecording', { clear = true })
    vim.api.nvim_create_autocmd('RecordingLeave', {
      group = macro_group,
      callback = function()
        print 'Macro recording stopped'
      end,
    })
    require('telescope').load_extension 'noice'
  end,
  keys = {
    { '<leader>d', mode = 'n', '<CMD>NoiceDismiss<CR>', desc = 'noice [d]ismiss' },
    { '<leader>sm', mode = 'n', '<CMD>Telescope notify<CR>', desc = '[s]earch [m]messages' },
  },
}
