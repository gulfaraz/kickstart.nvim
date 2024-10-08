-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
      routes = {
        {
          view = 'vsplit',
          filter = { event = 'msg_show', min_height = 20 },
          opts = { stop = true },
        },
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
      views = {
        vsplit = { size = '50%' },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
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
    end,
  },
  { 'tpope/vim-fugitive' },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {}
    end,
  },
  { 'github/copilot.vim' },
  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    opts = {}, -- your configuration
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_winwidth = 80
    end,
  },
  {
    'diepm/vim-rest-console',
    init = function()
      vim.g.vrc_set_default_mapping = 0
      vim.g.vrc_response_default_content_type = 'application/json'
      vim.g.vrc_output_buffer_name = '_OUTPUT.json'
      vim.g.vrc_auto_format_response_patterns = { json = 'jq' }

      vim.keymap.set('n', '<leader>rp', ':call VrcQuery()<CR>', { desc = '[R]est [P]ostman' })
    end,
  },
}
