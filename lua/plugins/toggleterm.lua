return {
  -- { 'alexghergh/nvim-tmux-navigation', enabled = false },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    enabled = true,
    config = function()
      local toggleTerm = require 'toggleterm'

      toggleTerm.setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-/>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
        highlights = {
          NormalFloat = {
            link = 'Normal',
          },
        },
        shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        persist_size = true,
        persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
        direction = 'vertical',
        close_on_exit = true, -- close the terminal window when the process exits
        clear_env = false, -- use only environmental variables from `env`, passed to jobstart()
        shell = vim.o.shell,
        auto_scroll = true, -- automatically scroll to the bottom on terminal output
        float_opts = {
          border = 'curved',
          height = 60,
          row = 1,
          col = 3,
          winblend = 3,
          title_pos = 'left',
        },
        winbar = {
          enabled = false,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end,
        },
        responsiveness = {
          horizontal_breakpoint = 135,
        },
      }
    end,
  },
}
