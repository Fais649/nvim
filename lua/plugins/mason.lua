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
    require('mason').setup()
    require('mason-lspconfig').setup {
      -- ensure_installed = { 'lua_ls', 'phpactor', 'jsonls', 'clangd', 'tailwindcss', 'gopls', 'rust_analyzer', 'ts_ls' },
      automatic_installation = true,
      automatic_enable = false,
    }
    require('mason-tool-installer').setup {
      ensure_installed = {},
    }

    require('fidget').setup {}
  end,
}
