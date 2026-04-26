return {
  {
    'ccaglak/phptools.nvim',
    enabled = false,
    keys = {
      { '<leader>Pg', '<cmd>PhpTools GetSet<cr>', desc = '[g]etters/setters' },
      { '<leader>Pn', '<cmd>PhpTools Create<cr>', desc = '[n]ew *' },
      { mode = 'v', '<leader>Pr', '<cmd>PhpTools Refactor<cr>', desc = 'w[r]ap selection' },
    },
    dependencies = {
      'ccaglak/namespace.nvim', -- optional - php namespace resolver
      'ccaglak/snippets.nvim', -- optional -- native snippet expander
    },
    config = function()
      require('phptools').setup {
        ui = {
          enable = false, -- default:true; false only if you have a UI enhancement plugin
          fzf = true, -- default:false; tests requires fzf used only in tests module otherwise there might long list  of tests
        },
        drupal_autoloader = { -- delete if you dont use it
          enable = false, -- default:false
          scan_paths = { '/web/modules/contrib/' }, -- Paths to scan for modules
          root_markers = { '.git' }, -- Project root markers
          autoload_file = '/vendor/composer/autoload_psr4.php', -- Autoload file path
        },
        custom_toggles = { -- delete if you dont use it
          enable = false, -- default:false
          -- { "foo", "bar", "baz" }, -- Add more custom toggle groups here
        },
      }
    end,
  },
  {
    'ta-tikoma/php.easy.nvim',
    config = true,
    keys = {
      { '<leader>P#', '<CMD>PHPEasyAttribute<CR>', ft = 'php', desc = '[#]attribute' },
      { '<leader>P/', '<CMD>PHPEasyDocBlock<CR>', ft = 'php', desc = '[/]docblock' },
      { '<leader>Py', '<CMD>PHPEasyCopy<CR>', ft = 'php', desc = '[c]opy' },
      { '<leader>Pd', '<CMD>PHPEasyDelete<CR>', ft = 'php', desc = '[d]elete' },
      { '<leader>Pe', '<CMD>PHPEasyExtends<CR>', ft = 'php', desc = '[e]xtend' },
      { '<leader>Pi', '<CMD>PHPEasyImplements<CR>', ft = 'php', desc = '[i]mplements' },
      { '<leader>Pc', '<CMD>PHPEasyAppendConstant<CR>', ft = 'php', mode = { 'n', 'v' }, desc = '[c]onstant' },
      { '<leader>Pp', '<CMD>PHPEasyAppendProperty<CR>', ft = 'php', mode = { 'n', 'v' }, desc = '[p]roperty' },
      { '<leader>Pm', '<CMD>PHPEasyAppendMethod<CR>', ft = 'php', mode = { 'n', 'v' }, desc = '[m]ethod' },
      { '<leader>P_', '<CMD>PHPEasyAppendConstruct<CR>', ft = 'php', desc = '[c]onstructor' },
      { '<leader>Pi', '<CMD>PHPEasyAppendInvoke<CR>', ft = 'php', desc = '[i]nvoke' },
      { '<leader>Pa', '<CMD>PHPEasyAppendArgument<CR>', ft = 'php', desc = '[a]rgument' },
    },
  },
}
