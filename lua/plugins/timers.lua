return {
  'ravsii/timers.nvim',
  ---@module "timers.config"
  ---@type Config
  opts = {
    -- Save timers across reloads / sessions.
    -- If true, neovim will save your active timers on disk and load them
    -- back after you enter it again.
    -- Keep in mind that timer is _still_ ticking, even when Neovim is
    -- closed.
    persistent = false,
    -- Default values for new timers, if they weren't passed explicitly.
    default_timer = {
      icon = '󱎫',
      log_level = vim.log.levels.INFO,
      message = 'STOP',
      title = 'timers.nvim',
    },
    dashboard = {
      -- Dashboard update interval, ms.
      -- Timers don't show anything below seconds (ms, ns, etc) anyways.
      update_interval = 1000,
      -- [0,1] for percentage of the screen, (1,∞) for an absolute value.
      width = 0.8,
      -- [0,1] for percentage of the screen, (1,∞) for an absolute value.
      height = 0.8,
      -- Font to use. Available fonts: DiamFont, Terrace, tmplr.
      -- Or, you can provide a custom font using "fonts" field and use its name
      -- font = 'DiamFont',
      fonts = {}, -- See: Custom fonts
    },
  },
}
