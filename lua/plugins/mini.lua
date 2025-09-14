return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }
    -- require('mini.jump').setup {}
    require('mini.pairs').setup {}
    -- require('mini.tabline').setup {}
    -- require('mini.indentscope').setup {}

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    local prose = require 'nvim-prose'
    statusline.setup {
      use_icons = vim.g.have_nerd_font,
      content = {
        active = function() -- your prose bit stays a function
          if not prose.is_available() then
            return 'punk.vim $> %-f:%2l'
            -- string.format('punk.vim -- %s', vim.api.nvim_buf_get_name(0))
          end
          return string.format('%s %s', 'punk.vim $> %-f:%2l %=', string.format('%s ⏱ %s', prose.word_count(), prose.reading_time()))
        end,

        inactive = function() -- <<< wrap in function
          return { '%f' }
        end,
      },

      fallback_separator = ' • ',
    }

    -- override location section as before
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
