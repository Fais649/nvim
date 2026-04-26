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
require 'autocmd'
require 'lsp'
--
-- Function to find Godot project root directory
local function find_godot_project_root()
  local cwd = vim.fn.getcwd()
  local search_paths = { '', '/..' }

  for _, relative_path in ipairs(search_paths) do
    local project_file = cwd .. relative_path .. '/project.godot'
    if vim.uv.fs_stat(project_file) then
      return cwd .. relative_path
    end
  end

  return nil
end

-- Function to check if server is already running
local function is_server_running(project_path)
  local server_pipe = project_path .. '/server.pipe'
  return vim.uv.fs_stat(server_pipe) ~= nil
end

-- Function to start Godot server if needed
local function start_godot_server_if_needed()
  local godot_project_path = find_godot_project_root()

  if godot_project_path and not is_server_running(godot_project_path) then
    vim.fn.serverstart(godot_project_path .. '/server.pipe')
    return true
  end

  return false
end

start_godot_server_if_needed()
