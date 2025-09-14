return {
  {
    'lommix/godot.nvim',
    config = function()
      --godot.lua
      local ok, godot = pcall(require, 'godot')
      if not ok then
        return
      end

      -- default config
      local config = {
        -- 	bin = "godot",
        -- 	gui = {
        -- 		console_config = @config for vim.api.nvim_open_win
        -- 	},
      }

      godot.setup(config)

      local function map(m, k, v)
        vim.keymap.set(m, k, v, { silent = true })
      end

      map('n', '<leader>dgr', godot.debugger.debug)
      map('n', '<leader>dgd', godot.debugger.debug_at_cursor)
      map('n', '<leader>dgq', godot.debugger.quit)
      map('n', '<leader>dgc', godot.debugger.continue)
      map('n', '<leader>dgs', godot.debugger.step)
    end,
  },
  -- { 'Cretezy/godot-server.nvim', },
  -- { 'habamax/vim-godot' },
}
