return {
  { 'habamax/vim-godot' },
  { 'skywind3000/asyncrun.vim' },
  { 'teatek/gdscript-extended-lsp.nvim', opts = { view_type = 'floating', picker = 'snacks' } },
  {
    'folke/snacks.nvim',
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- show hidden files
            ignored = false, -- don't show gitignored files
            exclude = { -- exclude specific patterns
              '*.uid', -- glob pattern for files ending with .uid
              'server.pipe', -- exact filename match
            },
          },
        },
      },
    },
  },
  {
    'lommix/godot.nvim',
    enabled = false,
    config = function()
      local godot = require 'godot'
      if not godot then
        return
      end

      local config = {
        bin = 'godot',
        dap = {
          host = '127.0.0.1',
          port = 6006,
        },
        gui = {
          console_config = {
            anchor = 'SW',
            border = 'double',
            col = 1,
            height = 10,
            relative = 'editor',
            row = 99999,
            style = 'minimal',
            width = 99999,
          },
        },

        expose_commands = true,
      }

      godot.setup(config)
      vim.keymap.set('n', '<leader>dgg', '<Cmd>GodotDebug<CR>')
      vim.keymap.set('n', '<leader>dgq', '<Cmd>GodotQuit<CR>')
      vim.keymap.set('n', '<leader>dgc', '<Cmd>GodotContinue<CR>')
      vim.keymap.set('n', '<leader>dgs', '<Cmd>GodotStep<CR>')
    end,
  },
  -- { 'Cretezy/godot-server.nvim', },
  -- { 'habamax/vim-godot' },
}
