local hyper = function(key)
  return '<C-S-A-' .. key .. '>'
end

local hyperX = function(key, keyTwo)
  return '<C-A-S-' .. key .. '>' .. keyTwo
end

-- [[Input Shortcuts]] -----------------------------
vim.keymap.set({ 'i' }, '<A-s>', '$', { desc = '$' })
vim.keymap.set({ 'i' }, '<A-l>', '->', { desc = '->' })

-- [[Select Shortcuts]] -----------------------------
vim.keymap.set('n', 'vaA', 'ggVG', { desc = '[A]ll' })
-- code helpers
vim.keymap.set({ 'n', 'v', 'x' }, 'gca', '<cmd>FzfLua lsp_code_actions<CR>', { desc = '[c]ode action' })
vim.keymap.set({ 'n', 'v', 'x' }, 'gd', '<cmd>FzfLua lsp_definitions<CR>', { desc = '[d]efinition' })
vim.keymap.set({ 'n', 'v', 'x' }, 'gr', '<cmd>FzfLua lsp_references<CR>', { desc = '[r]eferences' })
vim.keymap.set({ 'n', 'v' }, '<leader>er', vim.lsp.buf.rename, { desc = '[r]ename .' })
-----------------------------

-- [[Window Management]] -----------------------------
vim.keymap.set({ 'n', 'v' }, '<leader>w', '<cmd>w<CR>', { desc = '[w]rite' })
vim.keymap.set({ 'n', 'v' }, '<leader>x', '<cmd>x<CR>', { desc = '[x]close' })
vim.keymap.set({ 'n', 'v' }, '<leader>bj', '<cmd>split<CR>', { desc = 'split [j]]↓' })
vim.keymap.set({ 'n', 'v' }, '<leader>bl', '<cmd>vsplit<CR>', { desc = 'split [l]->' })
vim.keymap.set({ 'n', 'v' }, '<leader>btl', '<cmd>vsplit<CR><C-w>T', { desc = '[y]ank . new tab' })
vim.keymap.set({ 'n', 'v' }, '<leader>btn', '<cmd>tabnew<CR>', { desc = '[n]ew empty tab' })
vim.keymap.set({ 'n', 'v' }, '<leader>bty', '<cmd>tabnew<CR><cmd>Yazi<CR>', { desc = '[n]ew [y]azi tab' })
vim.keymap.set({ 'n', 'v' }, '<leader>btt', '<cmd>tabnew<CR><cmd>term<CR>', { desc = '[n]ew [t]erminal tab' })
----------------------------------------------------------

-- [[Movement]] -----------------------------
-- in buffer
vim.keymap.set({ 'n', 'v' }, '<up>', '14k', { desc = '↑ x14' })
vim.keymap.set({ 'n', 'v' }, '<down>', '14j', { desc = '↓ x14' })
vim.keymap.set({ 'n', 'v' }, '<left>', '0', { desc = 'start of line' })
vim.keymap.set({ 'n', 'v' }, '<right>', '$', { desc = 'end of line' })
vim.keymap.set({ 'n', 'v' }, '<Tab>', '%', { desc = 'matching [({})]' })
vim.keymap.set({ 'n', 'v' }, "'", '*', { desc = 'Find next' })
-- between buffers
vim.keymap.set({ 'n', 'v' }, 'g<space>', '<C-^>', { desc = 'last[]buffer' })
-- between tabs
vim.keymap.set({ 'n', 'v' }, '<C-tab>', '<C-^>', { desc = 'previous buffer' })
vim.keymap.set({ 'n', 'v' }, 'H', '<cmd>tabp<CR>', { desc = '[H]<- tab' })
vim.keymap.set({ 'n', 'v' }, 'L', '<cmd>tabn<CR>', { desc = '[L]-> tab' })
-- between splits
--
-- vim.keymap.set({ 'n', 'v' }, '<M-h>', '<C-w><C-h>', { desc = '[h]<- [s]plit' })
-- vim.keymap.set({ 'n', 'v' }, '<M-l>', '<C-w><C-l>', { desc = '[l]->[s]plit ' })
-- vim.keymap.set({ 'n', 'v' }, '<M-j>', '<C-w><C-j>', { desc = '[j]↓ [s]plit' })
-- vim.keymap.set({ 'n', 'v' }, '<M-k>', '<C-w><C-k>', { desc = '[k]↑ [s]plit' })
-- between files/directories
vim.keymap.set({ 'n', 'v' }, '<leader>ff', '<cmd>FzfLua files <CR>', { desc = '[f]iles' })
vim.keymap.set({ 'n', 'v' }, '<leader>f.', function()
  require('fzf-lua').files { cwd = vim.fn.expand '%:h' }
end, { desc = '[f]iles in [.]pwd' })
vim.keymap.set({ 'n', 'v' }, '<leader>fm', '<cmd>FzfLua marks <CR>', { desc = '[m]arks' })
vim.keymap.set({ 'n', 'v' }, '<leader>ft', '<cmd>FzfLua tabs <CR>', { desc = '[t]abs' })
vim.keymap.set({ 'n', 'v' }, '<leader>fi', '<cmd>FzfLua live_grep_native<CR>', { desc = '[i]n files' })
vim.keymap.set({ 'n', 'v' }, '<leader>fy', '<cmd>Yazi<CR>', { desc = '[y]azi' })
-- terminals
vim.keymap.set('t', '<Esc><Esc>', '<cmd>ToggleTerm<CR>', { desc = 'Exit terminal mode' })
vim.keymap.set({ 'n', 'v' }, '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = '[t]erminal' })
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<A-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<A-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<A-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<A-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<A-w>', [[<C-\><C-n><C-w>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd 'autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()'
----------------------------------------------------------

-- [[ MISC ]]	----------------------------------------------------------
-- autocmds
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
-- searchhl
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
----------------------------------------------------------
