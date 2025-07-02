return {
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        -- per_filetype = {
        --   ['html'] = {
        --     enable_close = true,
        --   },
        -- },
      }
    end,
  },
  {
    'pmizio/typescript-tools.nvim',
    enabled = false,
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require('typescript-tools').setup {
        on_attach = function(client, bufnr)
          local map = function(keys, func, desc, modes)
            modes = modes or { 'n' }
            vim.keymap.set(modes, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
          end

          -- Basic mappings
          map('<leader>rn', vim.lsp.buf.rename, 'Rename')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
          map('gd', vim.lsp.buf.definition, 'Goto Definition')
          map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
          map('gr', require('telescope.builtin').lsp_references, 'References')
          map('gi', require('telescope.builtin').lsp_implementations, 'Implementations')
          map('gt', require('telescope.builtin').lsp_type_definitions, 'Type Definitions')
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

          -- Document highlight
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

          -- Inlay hints toggle
          if client.server_capabilities.inlayHintProvider then
            map('<leader>th', function()
              vim.lsp.inlay_hint(bufnr, nil)
            end, 'Toggle Inlay Hints')
          end
        end,
        settings = {
          -- spawn additional tsserver instance to calculate diagnostics on it
          separate_diagnostic_server = true,
          -- "change"|"insert_leave" determine when the client asks the server about diagnostic
          publish_diagnostic_on = 'insert_leave',
          -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
          -- "remove_unused_imports"|"organize_imports") -- or string "all"
          -- to include all supported code actions
          -- specify commands exposed as code_actions
          expose_as_code_action = {},
          -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
          -- not exists then standard path resolution strategy is applied
          tsserver_path = nil,
          -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
          -- (see 💅 `styled-components` support section)
          tsserver_plugins = {},
          -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
          -- memory limit in megabytes or "auto"(basically no limit)
          tsserver_max_memory = 'auto',
          -- described below
          tsserver_format_options = {
            indentSize = 2,
            tabSize = 2,
            convertTabsToSpaces = true,
          },
          tsserver_file_preferences = {},
          -- locale of all tsserver messages, supported locales you can find here:
          -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
          tsserver_locale = 'en',
          -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
          complete_function_calls = false,
          include_completions_with_insert_text = true,
          -- CodeLens
          -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
          -- possible values: ("off"|"all"|"implementations_only"|"references_only")
          code_lens = 'off',
          -- by default code lenses are displayed on all referencable values and for some of you it can
          -- be too much this option reduce count of them by removing member references from lenses
          disable_member_code_lens = true,
          -- JSXCloseTag
          -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
          -- that maybe have a conflict if enable this feature. )
          jsx_close_tag = {
            enable = true,
            filetypes = { 'javascriptreact', 'typescriptreact' },
          },
          tsserver_plugins = {
            '@styled/typescript-styled-plugin',
          },
        },
      }
    end,
  },
}
