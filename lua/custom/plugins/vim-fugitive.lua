-- vim-fugitive is a git integration
-- https://github.com/tpope/vim-fugitive

return {
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
    vim.keymap.set('n', '|', fugitive_toggle)
  end,
}
