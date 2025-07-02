return {
  'gbprod/yanky.nvim',
  opts = {},
  dependencies = { 'folke/snacks.nvim' },
  lazy = false,
  keys = {
    {
      '<leader>p',
      function()
        -- local fzf = require 'fzf-lua'
        vim.cmd [[YankyRingHistory]]
      end,
      mode = { 'n', 'x' },
      desc = 'Open Yank History',
    },
  },
}
