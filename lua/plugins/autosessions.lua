return {
  'rmagatti/auto-session',
  enabled = false,
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    auto_restore_last_session = false,
    auto_restore = false,
  },
}
