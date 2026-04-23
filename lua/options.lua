vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.o.conceallevel = 1
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.showtabline = 1
vim.o.winborder = 'rounded'
vim.o.spell = false
vim.o.spelllang = 'en_us'
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.ignorecase = true
vim.o.infercase = true

vim.o.smartcase = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.cmdheight = 1
vim.opt.shortmess:append 'c'

vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.synmaxcol = 250
vim.o.redrawtime = 10000
vim.o.maxmempattern = 20000
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 15
vim.o.confirm = true
vim.o.autochdir = false
vim.o.autoread = true

vim.o.autocomplete = false
vim.o.pumborder = 'rounded'
vim.o.pummaxwidth = 40
vim.o.completeopt = 'menu,menuone,noselect,preinsert'
-- vim.o.complete = 'REGEX'
vim.o.fillchars = 'foldopen: ,foldclose: ,foldsep: ,diff:=,eob: '

vim.filetype.add {
  extension = {
    env = 'dotenv',
  },
  filename = {
    ['.env'] = 'dotenv',
    ['env'] = 'dotenv',
  },
  pattern = {
    ['[jt]sconfig.*.json'] = 'jsonc',
    ['%.env%.[%w_.-]+'] = 'dotenv',
  },
}

require('vim._core.ui2').enable {}
