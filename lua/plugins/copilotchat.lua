-- copilotchat is a github copilot chat integration
-- https://github.com/copilotc-nvim/copilotchat.nvim

return {
  {
    'copilotc-nvim/copilotchat.nvim',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim' },
    },
    build = 'make tiktoken',
    opts = {
      prompts = {
        Improve = {
          prompt = 'improve the selection to a world class level of code quality, readability, and efficiency',
          selection = function(source)
            local select = require 'CopilotChat.select'
            return select.visual(source)
          end,
        },
      },
    },
    keys = {
      { '<leader>mi', '<CMD>CopilotChatImprove<CR>', mode = 'v', desc = 'ask [m]opilot to [i]mprove code' },
      { '<leader>mm', '<CMD>CopilotChatToggle<CR>', mode = { 'v', 'n' }, desc = 'toggle [[m]]opilot chat' },
      { '<leader>me', '<CMD>CopilotChatExplain<CR>', mode = 'v', desc = 'ask [m]opilot to [e]xplain' },
      { '<leader>mr', '<CMD>CopilotChatReview<CR>', mode = 'v', desc = 'ask [m]opilot to [r]eview' },
      { '<leader>mf', '<CMD>CopilotChatFix<CR>', mode = 'v', desc = 'ask [m]opilot to [f]ix' },
      { '<leader>mo', '<CMD>CopilotChatOptimize<CR>', mode = 'v', desc = 'ask [m]opilot to [o]ptimize code' },
      { '<leader>md', '<CMD>CopilotChatDocs<CR>', mode = 'v', desc = 'ask [m]opilot to generate [d]ocs' },
      { '<leader>mt', '<CMD>CopilotChatTests<CR>', mode = 'v', desc = 'ask [m]opilot to generate [t]ests' },
      { '<leader>mc', '<CMD>CopilotChatCommit<CR>', mode = { 'v', 'n' }, desc = 'ask [m]opilot to generate a [c]ommit message' },
    },
  },
}
