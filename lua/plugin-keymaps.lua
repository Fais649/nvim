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
vim.keymap.set('n', '<leader>h', function()
  harpoon:list():add()
end, { desc = '[h]arpoon add' })
vim.keymap.set('n', '<leader>H', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = '[H]arpoon menu' })
vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end, { desc = 'h[a]rpoon [1]' })
vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end, { desc = 'harpoon [2]' })
vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end, { desc = 'harpoon [3]' })
vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end, { desc = 'harpoon [4]' })
vim.keymap.set('n', '<leader>k', function()
  harpoon:list():prev()
end, { desc = 'harpoon previous' })
vim.keymap.set('n', '<leader>j', function()
  harpoon:list():next()
end, { desc = 'harpoon next' })
-- fzf
local fzf = require 'fzf-lua'
vim.keymap.set('n', '<leader>fc', function()
  fzf.files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[c]onfig Neovim' })

vim.keymap.set('n', '<C-A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<A-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<A-\\>', require('smart-splits').move_cursor_previous)
-- neogen
vim.keymap.set('n', '<leader>ec', ":lua require('neogen').generate()<CR>", { desc = '[c]omment' })
----------------------------------------------------------
--- neotree
-- vim.keymap.set('n', '<C-e>', '<Cmd>Neotree<CR>')

-- local function openBufferSwitcher()
--   return function()
--     require('snacks.picker').buffers {
--       finder = 'buffers',
--       format = 'buffer',
--       hidden = false,
--       unloaded = true,
--       current = true,
--       sort_lastused = true,
--       win = {
--         input = {
--           keys = {
--             ['<c-x>'] = { 'bufdelete', mode = { 'n', 'i' } },
--             ['<c-k>'] = { 'list_up', mode = { 'n', 'i' } },
--             ['<c-j>'] = { 'list_down', mode = { 'n', 'i' } },
--           },
--         },
--         list = { keys = { ['dd'] = 'bufdelete' } },
--       },
--       layout = { preset = 'vscode', border = 'single' },
--       on_show = function(picker)
--         require('snacks.picker').actions.list_down(picker)
--       end,
--     }
--   end
-- end

-- vim.keymap.set('n', '<C-k>', openPrevBufferSwitcher(), { desc = 'bufswitch' })
-- vim.keymap.set('n', '<C-j>', openBufferSwitcher(), { desc = 'bufswitch' })

-- local oil = require 'oil'
--
-- local function toggleOil()
--   if oil.get_cursor_entry() then
--     oil.toggle_float()
--   else
--     oil.open_float(oil.get_current_dir(), { preview = {} })
--   end
-- end
--
-- vim.keymap.set('n', '<C-e>', toggleOil, { desc = 'Toggle Oil' })
--
