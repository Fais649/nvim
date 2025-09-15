require 'options'
require 'keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

local vimrc = vim.fn.stdpath 'config' .. '/vimrc.vim'
vim.cmd.source(vimrc)

require('lazy').setup({
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      preset = 'helix',
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '↑',
          Down = '↓',
          Left = '←',
          Right = '→',
          C = '󰘴',
          A = '󰘵',
          M = '󰘵',
          D = '󰘳',
          S = '󰘶',
          CR = '󰌑',
          Esc = '󱊷',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '',
          BS = '󰁮',
          Space = '󱁐',
          Tab = '󰌒',
          F1 = '󱊫',
          F2 = '󱊬',
          F3 = '󱊭',
          F4 = '󱊮',
          F5 = '󱊯',
          F6 = '󱊰',
          F7 = '󱊱',
          F8 = '󱊲',
          F9 = '󱊳',
          F10 = '󱊴',
          F11 = '󱊵',
          F12 = '󱊶',
        },
      },
      spec = {
        { 'g', group = '[g]oto' },
        { '<leader>G', group = '[G]it' },
        { 'ge', hidden = true },
        { 'gn', hidden = true },
        { 'gN', hidden = true },
        { 'gO', hidden = true },
        { 'gt', hidden = true },
        { 'gT', hidden = true },
        { 'gu', hidden = true },
        { 'gU', hidden = true },
        { 'g%', hidden = true },
        { 'gx', hidden = true },
        { 'g,', hidden = true },
        { 'g`', hidden = true },
        { 'g;', hidden = true },
        { 'gv', hidden = true },
        { 'g[', hidden = true },
        { 'g]', hidden = true },
        { 'g~', hidden = true },
        { 'gi', hidden = true },
        { 'gw', hidden = true },
        { 'gg', desc = '[g]first line' },
        { 'gcc', desc = 'toggle [c]omment line' },
        { 'gf', desc = '[f]ile under cursor' },
        { '<leader>eu', proxy = '~', desc = 'toggle case' },
        { '<leader>a', group = 'h[a]rpoon' },
        { '<leader>d', group = '[d]ebug' },
        { '<leader>f', group = '[f]ind' },
        { '<leader>b', group = '[b]uffer' },
        { '<leader>bt', group = '[t]ab' },
        { '<leader>e', group = '[e]dit' },
        { '<leader>t', group = '[t]oggle' },
        { '<leader>tG', group = '[G]it' },
        { '<leader>P', group = '[P]hp' },
        { '<leader>L', group = '[L]ove' },
        { '<leader>X', group = '[X]code' },
        { '<leader>g', group = '[g]it', mode = { 'n', 'v' } },
      },
    },
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby', 'gdscript' } },
    },
  },
  { import = 'plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
vim.opt.background = 'dark'
require 'plugin-keymaps'
