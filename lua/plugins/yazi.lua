---@type LazySpec
return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  enabled = true,
  dependencies = {
    'folke/snacks.nvim',
  },
  keys = {},
  ---@type YaziConfig | {}
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = '<f11>',
    },
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 0
  end,
}
