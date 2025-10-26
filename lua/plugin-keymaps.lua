-- [[Plugin Specific]] ----------------------------------------------------------
-- xcodebuild
vim.keymap.set({ 'n', 'v' }, '<leader>Xp', ':XcodebuildProjectManager<CR>', { desc = '[p]roject Manager' })
vim.keymap.set({ 'n', 'v' }, '<leader>Xfr', ':XcodebuildRenameCurrentFile<CR>', { desc = '[f]ile [r]ename' })
vim.keymap.set({ 'n', 'v' }, '<leader>Xfn', ':XcodebuildCreateNewFile<CR>', { desc = '[f]ile [n]ew' })
vim.keymap.set({ 'n', 'v' }, '<leader>Xa', ':XcodebuildCodeActions<CR>', { desc = '[a]ctions' })
vim.keymap.set({ 'n', 'v' }, '<leader>Xx', ':XcodebuildBuildRun<CR>', { desc = 'E[x]ecute Build&Run' })
vim.keymap.set({ 'n', 'v' }, '<leader>Xl', ':XcodebuildToggleLogs<CR>', { desc = '[l]ogs' })
-- yanky
vim.keymap.set({ 'n', 'x' }, '<leader>fp', '<Plug>(YankyRingHistory)', { desc = '[p]ut History' })
vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)', { desc = '[p]ut After' })
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)', { desc = '[p]ut Before' })
-- harpoon
local harpoon = require 'harpoon'
vim.keymap.set('n', '<leader>aa', function()
  harpoon:list():add()
end, { desc = 'h[a]rpoon [a]dd' })
vim.keymap.set('n', '<leader>am', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'h[a]rpoon [m]enu' })
vim.keymap.set('n', '<leader>a1', function()
  harpoon:list():select(1)
end, { desc = 'h[a]rpoon [1]' })
vim.keymap.set('n', '<leader>a2', function()
  harpoon:list():select(2)
end, { desc = 'h[a]rpoon [2]' })
vim.keymap.set('n', '<leader>a3', function()
  harpoon:list():select(3)
end, { desc = 'h[a]rpoon [3]' })
vim.keymap.set('n', '<leader>a4', function()
  harpoon:list():select(4)
end, { desc = 'h[a]rpoon [4]' })
-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-S-up>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-S-down>', function()
  harpoon:list():next()
end)
-- fzf
local fzf = require 'fzf-lua'
vim.keymap.set('n', '<leader>fc', function()
  fzf.files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[c]onfig Neovim' })
-- tmux
local nvim_tmux_nav = require 'nvim-tmux-navigation'
vim.keymap.set('n', '<M-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', '<M-j>', nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', '<M-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', '<M-l>', nvim_tmux_nav.NvimTmuxNavigateRight)
-- neogen
vim.keymap.set('n', '<leader>ec', ":lua require('neogen').generate()<CR>", { desc = '[c]omment' })
----------------------------------------------------------
