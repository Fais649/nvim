return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'igorlfs/nvim-dap-view',
    'nvim-neotest/nvim-nio',
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'theHamsta/nvim-dap-virtual-text',
    'leoluz/nvim-dap-go',
    'mxsdev/nvim-dap-vscode-js',
  },
  keys = {
    {
      '<leader>dd',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },

    {
      '<leader>dq',
      function()
        require('dap').terminate()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<leader>dj',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<leader>dl',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<leader>dk',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>D',
      function()
        require('dap-view').toggle()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>dB',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    {
      '<leader>d<TAB>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
  },
  config = function()
    local dap = require 'dap'
    -- local dapui = require 'dapui'
    local utils = require 'dap.utils'

    dap.adapters['pwa-node'] = {
      type = 'server',
      port = '5173',
      executable = {
        command = 'js-debug-adapter',
        args = {
          '5173',
        },
      },
    }
    dap.adapters.godot = {
      type = 'server',
      host = '127.0.0.1',
      port = 6006,
    }
    dap.configurations.gdscript = {
      {
        type = 'godot',
        request = 'launch',
        name = 'Launch scene',
        project = '${workspaceFolder}',
      },
    }

    for _, language in ipairs { 'javascript' } do
      dap.configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach to process ID',
          processId = utils.pick_process,
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-chrome',
          request = 'launch',
          name = 'Launch & Debug Chrome',
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = 'Enter URL: ',
                default = 'http://localhost:3000',
              }, function(url)
                if url == nil or url == '' then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          webRoot = vim.fn.getcwd(),
          protocol = 'inspector',
          sourceMaps = true,
          userDataDir = false,
        },

        {
          name = 'Run debug server',
          type = 'pwa-node',
          request = 'launch',
          command = 'bun run dev',
          address = 'localhost',
          port = 5173,
          restart = true,
          skipFiles = '<node_internals>/**',
          trace = true,
        },
        {
          name = 'Attach to Bun in Docker',
          type = 'pwa-node',
          request = 'launch',
          address = 'localhost',
          port = 4000,
          restart = true,
          skipFiles = '<node_internals>/**',
          trace = true,
        },
      }
    end

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      automatic_installation = false,
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
        php = function(config)
          config.configurations = {
            {
              type = 'php',
              request = 'launch',
              name = 'Listen for XDebug',
              port = 9003,
              log = true,
              pathMappings = {
                ['/var/www/html/'] = vim.fn.getcwd() .. '/',
              },
              hostname = '0.0.0.0',
            },
            {
              type = 'shell',
              request = 'ddev xdebug on',
              name = 'DDEV: Activate XDebug',
            },
            {
              type = 'shell',
              request = 'ddev xdebug off',
              name = 'DDEV: Deactivate XDebug',
            },
          }

          require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
      },

      ensure_installed = {
        'delve',
        'php-debug-adapter',
      },
    }

    -- dapui.setup {
    --   icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    --   controls = {
    --     icons = {
    --       pause = '⏸',
    --       play = '▶',
    --       step_into = '⏎',
    --       step_over = '⏭',
    --       step_out = '⏮',
    --       step_back = 'b',
    --       run_last = '▶▶',
    --       terminate = '⏹',
    --       disconnect = '⏏',
    --     },
    --   },
    -- }

    vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })

    local breakpoint_icons = vim.g.have_nerd_font
        and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    for type, icon in pairs(breakpoint_icons) do
      local tp = 'Dap' .. type
      local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    -- dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    -- dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('dap-go').setup {
      delve = {
        detached = vim.fn.has 'win32' == 0,
      },
    }
  end,
}
