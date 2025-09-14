return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      php = { 'pretty-php' },
      twig = { 'twig-cs-fixer' },
      lua = { 'stylua' },
    },
    formatters = {
      -- ['twig-cs-fixer'] = {
      --   command = 'twig-cs-fixer',
      --   args = {
      --     'lint',
      --     '--fix',
      --     -- '--rules=@PSR12', -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
      --     -- '$FILENAME',
      --   },
      --   stdin = false,
      -- },
      -- php = {
      --   command = 'php-cs-fixer',
      --   args = {
      --     'fix',
      --     '$FILENAME',
      --     '--config=/your/path/to/config/file/[filename].php',
      --     '--allow-risky=yes', -- if you have risky stuff in config, if not you dont need it.
      --   },
      --   stdin = false,
      -- },
    },
  },
}
