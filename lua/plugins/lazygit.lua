-- lazygit is a lazygit integration
-- https://github.com/kdheepak/lazygit.nvim

return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '|', '<CMD>LazyGit<CR>', desc = 'lazygit' },
  },
  init = function()
    -- create an alias for nvim in .zshrc
    -- alias nvim="nvim --listen /tmp/nvim-server.pipe"
    --
    -- update lazygit config file ~/Library/Application\ Support/lazygit/config.yml
    --
    -- quitOnTopLevelReturn: false
    --
    -- os:
    --   edit: '[ -z "$NVIM" ] && (nvim -- {{filename}}) || (nvim --server $NVIM --remote-send ''<CMD>bd!<CR><CMD>lua EditFromLazygit({{filename}})<CR>'')'
    --   editAtLine: '[ -z "$NVIM" ] && (nvim +{{line}} -- {{filename}}) || nvim --server $NVIM --remote-send ''<CMD>bd!<CR><CMD>lua EditLineFromLazygit({{filename}},{{line}})<CR>'''

    function EditLineFromLazygit(file_path, line)
      local path = vim.fn.expand '%:p'
      if path == file_path then
        vim.cmd(tostring(line))
      else
        vim.cmd('e ' .. file_path)
        vim.cmd(tostring(line))
      end
    end

    function EditFromLazygit(file_path)
      local path = vim.fn.expand '%:p'
      if path == file_path then
        return
      else
        vim.cmd('e ' .. file_path)
      end
    end
  end,
}
