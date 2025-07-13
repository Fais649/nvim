-- [[Movement]]
vim.keymap.set({ 'n', 'v' }, '<up>', '12k')
vim.keymap.set({ 'n', 'v' }, '<down>', '12j')
vim.keymap.set({ 'n', 'v' }, '<left>', '0')
vim.keymap.set({ 'n', 'v' }, '<right>', '$')
vim.keymap.set({ 'n', 'v' }, '<Tab>', '%')
vim.keymap.set({ 'n', 'v' }, '<leader><Tab>', '<C-^>')
vim.keymap.set({ 'n', 'v' }, '<S-up>', '<C-o>')
vim.keymap.set({ 'n', 'v' }, '<S-down>', '<C-i>')
vim.keymap.set({ 'n', 'v' }, '<leader>w', ':w<CR>')
vim.keymap.set({ 'n', 'v' }, '<C-x>', ':x<CR>')
vim.keymap.set({ 'n', 'v' }, "'", '*')

-- [[Harpoon]]
vim.keymap.set('n', '<A-h>', function()
  local harpoon = require 'harpoon'
  harpoon:list():add()
end)
vim.keymap.set('n', '<leader><leader>', function()
  local harpoon = require 'harpoon'
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set('n', '<A-y>', function()
  local harpoon = require 'harpoon'
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<A-u>', function()
  local harpoon = require 'harpoon'
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<A-i>', function()
  local harpoon = require 'harpoon'
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<A-o>', function()
  local harpoon = require 'harpoon'
  harpoon:list():select(4)
end)
vim.keymap.set('n', '<A-k>', function()
  local harpoon = require 'harpoon'
  harpoon:list():prev()
end)
vim.keymap.set('n', '<A-j>', function()
  local harpoon = require 'harpoon'
  harpoon:list():next()
end)

-- [[Window Splits]]
vim.keymap.set({ 'n', 'v' }, '<leader>v', ':vsplit<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>s', ':split<CR>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>,', function()
  Snacks.scratch()
end, { desc = 'Open Scratch' })
vim.keymap.set('n', '<leader>.', function()
  Snacks.scratch.select()
end, { desc = 'Select Scratch' })

-- [[Yanky]]
vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')
vim.keymap.set('n', '<c-u>', '<Plug>(YankyPreviousEntry)')
vim.keymap.set('n', '<c-i>', '<Plug>(YankyNextEntry)')

-- [[Terminal]]
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<Esc><Esc>', '<cmd>ToggleTerm<CR>', { desc = 'Exit terminal mode' })
vim.keymap.set({ 'n', 'v' }, '<leader>t', ':ToggleTerm<CR>')

-- [[Diagnostics]]
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>l', function()
  Snacks.notifier.show_history()
end, { desc = 'Open Log History' })

-- [[FzfLua]]
vim.keymap.set({ 'n', 'v', 'x' }, '<F2>', ':FzfLua files resume=true<CR>', { desc = 'Find Files' })
vim.keymap.set({ 'n', 'v', 'x' }, '<F3>', ':FzfLua live_grep_native resume=true<CR>', { desc = 'Live Grep' })
vim.keymap.set({ 'n', 'v', 'x' }, '<C-c>', ':FzfLua lsp_code_actions<CR>', { desc = 'Code Action' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>sd', ':FzfLua lsp_workspace_diagnostics<CR>', { desc = 'Code Action' })
vim.keymap.set({ 'n', 'v', 'x' }, '<C-d>', ':FzfLua lsp_definitions<CR>', { desc = 'Goto Declaration' })
vim.keymap.set({ 'n', 'v', 'x' }, 'gD', ':FzfLua lsp_declarations<CR>', { desc = 'Goto Declaration' })
vim.keymap.set({ 'n', 'v', 'x' }, 'gr', ':FzfLua lsp_references<CR>', { desc = 'References' })
vim.keymap.set({ 'n', 'v', 'x' }, 'gi', ':FzfLua lsp_implementations<CR>', { desc = 'Implementations' })
vim.keymap.set({ 'n', 'v', 'x' }, 'gt', ':FzfLua lsp_typedefs<CR>', { desc = 'Type Definitions' })
vim.keymap.set({ 'n', 'v', 'x' }, 'gw', ':FzfLua lsp_live_workspace_symbols<CR>', { desc = 'Workspace Symbols' })
vim.keymap.set({ 'n', 'v' }, '<C-n>', vim.lsp.buf.rename, { desc = 'Rename' })

-- [[Xcodebuild]]
vim.keymap.set({ 'n', 'v' }, '<leader>xp', ':XcodebuildProjectManager<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>xr', ':XcodebuildRenameCurrentFile<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>xc', ':XcodebuildCreateNewFile<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>xa', ':XcodebuildCodeActions<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>xx', ':XcodebuildBuildRun<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>xl', ':XcodebuildToggleLogs<CR>')

-- [[ Basic Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ZenMode]]
vim.keymap.set({ 'n', 'v' }, '<leader>z', ':ZenMode<CR>', { desc = 'Zen' })

-- [[Remove Search HL]]
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
