-- vim.opt.completeopt = 'menu,menuone,noselect,popup' -- Ensures the menu appears even for a single match and uses the native popup window.
-- vim.o.autocomplete = true -- Enables the overall completion feature.

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_completion', { clear = true }),
  callback = function(args)
    local client_id = args.data.client_id
    if not client_id then
      return
    end

    local client = vim.lsp.get_client_by_id(client_id)
    if client and client:supports_method 'textDocument/completion' then
      -- Enable native LSP completion for this client + buffer
      vim.lsp.completion.enable(false, client_id, args.buf, {
        autotrigger = false, -- auto-show menu as you type (recommended)
        -- You can also set { autotrigger = false } and trigger manually with <C-x><C-o>
      })
    end
  end,
})

local servers = {
  'gopls',
  'buf_ls',
  'qmlls',
  'astro',
  'rust_analyzer',
  'svelte',
  'phpactor',
  'tailwindcss',
  'jsonls',
  'cmake',
  'ts_ls',
  'pyright',
  'clangd',
  'gdscript',
  'lua_ls',
  'laravel_ls',
}

local on_attach = function(client, bufnr)
  local map = function(keys, func, desc, modes)
    modes = modes or { 'n' }
    vim.keymap.set(modes, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      group = group,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = bufnr,
      group = group,
      callback = vim.lsp.buf.clear_references,
    })
  end
  if client.server_capabilities.inlayHintProvider then
    map('<leader>eth', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, '[i]nlay hints')
  end
end

local esp32 = require 'esp32'
vim.g.pioConfig = {
  lsp = 'clangd', -- value: clangd | ccls
  clangd_source = 'ccls', -- value: ccls | compiledb, For detailed explation check :help platformio-clangd_source
  menu_key = '<leader>\\', -- replace this menu key  to your convenience
  debug = false, -- enable debug messages
}
local pok, platformio = pcall(require, 'platformio')
if pok then
  platformio.setup(vim.g.pioConfig)
end

for _, name in pairs(servers) do
  vim.lsp.enable(name)
  vim.lsp.on_attach = on_attach
end

vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_lines = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚',
      [vim.diagnostic.severity.WARN] = '󰀪',
      [vim.diagnostic.severity.INFO] = '󰋽',
      [vim.diagnostic.severity.HINT] = '󰌶',
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarnMsg',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarnMsg',
    },
  },
}
