-- telescope is a fuzzy finder
-- https://github.com/nvim-telescope/telescope.nvim

return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          n = {
            ['<C-d>'] = require('telescope.actions').delete_buffer,
          },
          i = {
            ['<C-d>'] = require('telescope.actions').delete_buffer,
          },
        },
      },
      extensions = {
        fzf = {},
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- common glob filters for find functions
    local find_globs = {
      '--glob',
      '!.git', -- ignore .git directory
      '--glob',
      '!node_modules', -- ignore node_modules directory
      '--glob',
      '!.yarn', -- ignore .yarn directory
      '--glob',
      '!dist', -- ignore dist directory
      '--glob',
      '!www', -- ignore www directory
      '--glob',
      '!.angular', -- ignore .angular directory
      '--glob',
      '!__pycache__', -- ignore __pycache__ directory
      '--glob',
      '!.venv', -- ignore .venv directory
    }

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[s]earch [k]eymaps' })
    vim.keymap.set('n', '<leader>sf', function()
      require('telescope.builtin').find_files {
        hidden = true,
        no_ignore = true,
        no_ignore_parent = true,
        follow = true,
        cwd = vim.uv.cwd(),
        find_command = vim.list_extend({
          'rg',
          '--files',
          '--color=never',
          '--no-ignore',
          '--hidden',
          '--follow',
        }, find_globs),
      }
    end, { desc = '[s]earch [f]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[s]earch [s]elect telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[s]earch [d]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[s]earch [r]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[s]earch recent files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] fuzzy search in buffer' })

    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[s]earch [/] in open files' })

    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[s]earch [n]eovim files' })

    local multigrep = function(opts)
      opts = opts or {}
      opts.cwd = opts.cwd or vim.uv.cwd()

      local finder = require('telescope.finders').new_async_job {
        command_generator = function(prompt)
          if not prompt or prompt == '' then
            return nil
          end

          local pieces = vim.split(prompt, '  ')
          local args = { 'rg' }

          if pieces[1] then
            table.insert(args, '-e')
            table.insert(args, pieces[1])
          end

          for i = 2, #pieces do
            table.insert(args, '-g')
            table.insert(args, pieces[i])
          end

          return vim
            .iter({
              args,
              vim.list_extend({
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--unrestricted', -- won't respect .gitignore (etc.) files
                '--unrestricted', -- search hidden files and directories
                '--unrestricted', -- search binary files
              }, find_globs),
            })
            :flatten()
            :totable()
        end,
        entry_maker = require('telescope.make_entry').gen_from_vimgrep(opts),
        cwd = opts.cwd,
      }

      require('telescope.pickers')
        .new(opts, {
          debounce = 100,
          prompt_title = 'Multi Grep',
          finder = finder,
          previewer = require('telescope.config').values.grep_previewer(opts),
          sorter = require('telescope.sorters').empty(),
        })
        :find()
    end

    vim.keymap.set('n', '<leader>sg', multigrep, { desc = '[s]earch by [g]rep' })
  end,
}
