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
      -- keymap to dismiss noice
      vim.keymap.set('n', '<leader>d', '<CMD>NoiceDismiss<CR>', { desc = 'noice [d]ismiss' })
      -- Load telescope extension
      require('telescope').load_extension 'noice'
    end,
  },
  {
    'tpope/vim-fugitive',
    init = function()
      local function fugitive_toggle()
        for _, win in ipairs(vim.fn.getwininfo()) do
          if win.variables and win.variables.fugitive_status then
            vim.cmd(win.winnr .. 'wincmd c') -- Close Fugitive window
            return
          end
        end
        vim.cmd 'vertical Git' -- Open Fugitive
        vim.cmd 'vertical resize 80' -- Resize window
      end

      vim.keymap.set('n', '<leader>gf', '<CMD>Git blame<CR>', { desc = '[g]it [f]ugitive blame' })
      -- vim.keymap.set('n', '<leader>tg', fugitive_toggle, { desc = '[t]oggle [g]it' })
      vim.keymap.set('n', '|', fugitive_toggle)
    end,
  },
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

      vim.keymap.set('n', '<leader>td', '<CMD>:DBUIToggle<CR>', { desc = '[t]oggle [d]atabase' })
    end,
  },
  {
    'diepm/vim-rest-console',
    init = function()
      vim.g.vrc_set_default_mapping = 0
      vim.g.vrc_response_default_content_type = 'application/json'
      vim.g.vrc_output_buffer_name = '_OUTPUT.json'
      vim.g.vrc_auto_format_response_patterns = { json = 'jq' }

      vim.keymap.set('n', '<leader>p', '<CMD>call VrcQuery()<CR>', { desc = 'rest [p]ostman' })
    end,
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        vim.keymap.set({ 'n', 'i' }, '<C-\\>', '<CMD>exe v:count1 . "ToggleTerm size=100 direction=vertical"<CR>'),

        vim.api.nvim_buf_set_keymap(0, 't', '<ESC>', '<C-\\><C-n>', { noremap = true }),
        vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', '<C-\\><C-n><C-W>k', { noremap = true }),
      }
    end,
  },
  {
    'rmagatti/alternate-toggler',
    config = function()
      require('alternate-toggler').setup {}

      vim.keymap.set('n', '<leader>ta', '<CMD>:ToggleAlternate<CR>', { desc = '[t]oggle [a]lternate' })
    end,
    event = { 'BufReadPost' }, -- lazy load after reading a buffer
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gL', '<CMD>LazyGit<CR>', desc = '[g]it [L]azy' },
    },
  },
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon',
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim',
    },
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Uncomment whichever supported plugin(s) you use
      -- "nvim-tree/nvim-tree.lua",
      'nvim-neo-tree/neo-tree.nvim',
      -- "simonmclean/triptych.nvim"
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
}
