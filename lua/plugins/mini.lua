local function setup_statusline()
  local statusline = require 'mini.statusline'
  statusline.setup {
    use_icons = vim.g.have_nerd_font,
    content = {
      active = function()
        return 'punk.vim $> %-f:%2l'
      end,

      inactive = function()
        return { '%f' }
      end,
    },

    fallback_separator = ' • ',
  }

  ---@diagnostic disable-next-line: duplicate-set-field
  statusline.section_location = function()
    return '%2l:%-2v'
  end
end

return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.pairs').setup {}
    require('mini.surround').setup()

    -- require('mini.files').setup { windows = { preview = true } }
    -- require('mini.misc').setup {}
    -- MiniMisc.setup_auto_root()

    -- setup_statusline()
  end,
}
