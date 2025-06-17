local opts = { noremap = true, silent = true }

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'exit terminal mode' })

vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'diagnostic [q]uickfix list' })
vim.keymap.set('n', '<leader>Q', '<CMD>cclose<CR>', { desc = 'close [Q]uickfix list' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to the upper window' })

vim.keymap.set({ 'n', 'i' }, '<leader>tr', '<CMD>set rnu!<CR>', { desc = '[t]oggle [r]elative line number' })

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('x', '<leader>p', [["_dP]])

local function safe_keymap_del(mode, lhs)
  local maps = vim.api.nvim_get_keymap(mode)
  for _, map in ipairs(maps) do
    if map.lhs == lhs then
      vim.keymap.del(mode, lhs)
      return true
    end
  end
  return false
end

safe_keymap_del('n', 'gO')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    local ts_utils = require 'nvim-treesitter.ts_utils'
    local node = ts_utils.get_node_at_cursor()
    local disable_wrap = false

    -- Save original textwidth so we can restore it
    local default_textwidth = vim.b._default_textwidth or vim.bo.textwidth
    vim.b._default_textwidth = default_textwidth -- persist per buffer

    while node do
      local node_type = node:type()

      -- Match common string node types (adjust as needed)
      if node_type:match 'string' or node_type == 'string_literal' or node_type == 'template_string' or node_type == 'raw_string' then
        disable_wrap = true
        break
      end

      node = node:parent()
    end

    -- Toggle textwidth dynamically
    vim.bo.textwidth = disable_wrap and 0 or default_textwidth
  end,
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
--     end
--   end,
-- })
