local hyper = function(key)
  return '<C-S-A-' .. key .. '>'
end

local hyperX = function(key, keyTwo)
  return '<C-A-S-' .. key .. '>' .. keyTwo
end

-- [[Input Shortcuts]] -----------------------------
vim.keymap.set({ 'i' }, '<M-s>', '$', { desc = '$' })
vim.keymap.set({ 'i' }, '<M-l>', '->', { desc = '->' })

-- [[Select Shortcuts]] -----------------------------
vim.keymap.set('n', 'vaA', 'ggVG', { desc = '[A]ll' })
-- code helpers
vim.keymap.set({ 'n', 'v', 'x' }, 'gd', '<cmd>:silent FzfLua lsp_definitions<CR>', { silent = true, desc = '[d]efinition' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader><leader>', '<cmd>:silent FzfLua buffers<CR>', { silent = true, desc = 'buffers' })
vim.keymap.set({ 'n', 'v', 'x' }, 'gr', '<cmd>:silent FzfLua lsp_references<CR>', { silent = true, desc = '[r]eferences' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>ed', '<cmd>:FzfLua lsp_document_diagnostics<CR>', { silent = true, desc = '[d]iagnostics' })
vim.keymap.set({ 'n', 'v' }, '<leader>er', vim.lsp.buf.rename, { desc = '[r]ename .' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>ea', '<cmd>:silent FzfLua lsp_code_actions<CR>', { silent = true, desc = '[c]ode action' })
-----------------------------

-- [[Window Management]] -----------------------------
vim.keymap.set({ 'n', 'v' }, '<leader>w', '<cmd>w<CR>', { desc = '[w]rite' })
vim.keymap.set({ 'n', 'v' }, '<leader>x', '<cmd>x<CR>', { desc = '[x]close' })
vim.keymap.set({ 'n', 'v' }, '<leader>s', '<cmd>split<CR>', { desc = 'split ↓' })
vim.keymap.set({ 'n', 'v' }, '<leader>v', '<cmd>vsplit<CR>', { desc = 'split ->' })
vim.keymap.set({ 'n', 'v' }, '<leader>n', '<cmd>tabnew<CR>', { desc = '[n]ew empty tab' })
----------------------------------------------------------

-- [[Movement]] -----------------------------
-- in buffer
vim.keymap.set({ 'n', 'v' }, '<up>', '14k', { desc = '↑ x14' })
vim.keymap.set({ 'n', 'v' }, '<down>', '14j', { desc = '↓ x14' })
vim.keymap.set({ 'n', 'v' }, '<left>', '0', { desc = 'start of line' })
vim.keymap.set({ 'n', 'v' }, '<right>', '$', { desc = 'end of line' })
vim.keymap.set({ 'n', 'v' }, '-', '%', { desc = 'matching [({})]', noremap = true })
vim.keymap.set({ 'n', 'v' }, "'", '*', { desc = 'Find next' })
-- between buffers
vim.keymap.set({ 'n', 'v' }, '<leader><Tab>', '<C-^>', { desc = 'previous[_]buffer' })
-- between tabs
vim.keymap.set({ 'n', 'v' }, '<C-h>', '<cmd>tabp<CR>', { desc = '[H]<- tab' })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<cmd>tabn<CR>', { desc = '[L]-> tab' })
-- history
vim.keymap.set({ 'n', 'v' }, '<C-k>', '<C-O>', { desc = '[H]<- tab' })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '<C-I>', { desc = '[L]-> tab' })
-- between files/directories
vim.keymap.set({ 'n', 'v' }, '<C-f>', '<cmd>FzfLua global<CR>', { desc = '[f]iles' })
vim.keymap.set({ 'n', 'v' }, '<C-e>', '<cmd>Yazi<CR>', { desc = '[y]azi' })

vim.keymap.set('n', '<C-.>', function()
  require('fzf-lua').files {
    prompt = '󰝰  Select directory> ',
    cwd = vim.fn.expand '~', -- start in home dir
    fd_opts = '--type d', -- only show directories
    file_icons = false,
    actions = {
      ['default'] = function(selected)
        if not selected or vim.tbl_isempty(selected) then
          return
        end
        local dir = selected[1]
        vim.cmd('cd ~/' .. vim.fn.fnameescape(dir))
        print('📂 Changed directory to: ' .. dir)
        vim.schedule(function()
          require('fzf-lua').files { cwd = dir }
        end)
      end,
    },
  }
end, { desc = 'Fzf: cd into a dir (from ~)' })
vim.keymap.set('n', '<leader>f~', function()
  require('fzf-lua').files {
    prompt = '󰝰  Select directory> ',
    cwd = vim.fn.expand '~', -- start in home dir
    fd_opts = '--type d', -- only show directories
    file_icons = false,
    actions = {
      ['default'] = function(selected)
        if not selected or vim.tbl_isempty(selected) then
          return
        end
        local dir = selected[1]
        vim.cmd('cd ~/' .. vim.fn.fnameescape(dir))
        print('📂 Changed directory to: ' .. dir)
        vim.schedule(function()
          require('fzf-lua').files { cwd = dir }
        end)
      end,
    },
  }
end, { desc = 'Fzf: cd into a dir (from ~)' })
vim.keymap.set({ 'n', 'v' }, '<leader>f.', function()
  require('fzf-lua').files { cwd = vim.fn.expand '%:h' }
end, { desc = '[f]iles in [.]pwd' })
vim.keymap.set({ 'n', 'v' }, '<leader>fm', '<cmd>FzfLua marks <CR>', { desc = '[m]arks' })
vim.keymap.set({ 'n', 'v' }, '<leader>ft', '<cmd>FzfLua tabs <CR>', { desc = '[t]abs' })
vim.keymap.set({ 'n', 'v' }, '<C-g>', '<cmd>FzfLua live_grep_native resume=true<CR>', { desc = '[/]in files' })
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
-- grug
vim.keymap.set('n', '<leader>fr', ':GrugFar<CR>', { desc = 'Grug' })
