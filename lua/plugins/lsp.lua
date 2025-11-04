return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
  },
  event = 'VimEnter',
  config = function()
    local blink_cmp = require 'blink.cmp'

    require('mason').setup()
    require('mason-lspconfig').setup {
      -- ensure_installed = { 'lua_ls', 'phpactor', 'jsonls', 'clangd', 'tailwindcss', 'gopls', 'rust_analyzer', 'ts_ls' },
      automatic_installation = true,
      automatic_enable = false,
    }
    require('mason-tool-installer').setup {
      -- ensure_installed = { 'stylua' },
    }

    require('fidget').setup {}

    local capabilities = blink_cmp.get_lsp_capabilities()

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

    local servers = {
      gopls = {},
      qmlls = {},
      astro = {},
      rust_analyzer = {},
      svelte = {},
      phpactor = {},
      tailwindcss = {},
      jsonls = {},
      cmake = {},
      marksman = {},
      ts_ls = {},
      clangd = {},
      gdscript = {
        name = 'godot',
        cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
      },
      lua_ls = {
        Lua = {
          workspace = {
            library = {
              ['/home/fais/punk.systems/code/lua/love/lovrd/api/cats'] = true,
              ['/home/fais/.local/share/nvim/lazy/love2d.nvim/luasocket/library'] = true,
            },
          },
        },
      },
      -- sourcekit = {
      --   cmd = { 'sourcekit-lsp' },
      --   filetypes = { 'swift', 'objective-c', 'objective-c++' },
      --   settings = {
      --     swift = { editor = { enableSemantic = true } },
      --   },
      -- },
    }

    -- vim.lsp.enable 'sourcekit'
    -- vim.lsp.enable 'jsonls'
    -- vim.lsp.enable 'cmake'
    for name, opts in pairs(servers) do
      opts.capabilities = capabilities
      opts.on_attach = on_attach
      vim.lsp.config(name, opts)
      vim.lsp.enable(name)
    end

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      -- virtual_text = { source = 'if_many', spacing = 2 },
      -- virtual_lines = true,
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
  end,
}
