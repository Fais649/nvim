-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '<leader>Gn', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = '[H]unk [N]ext' })

        map('n', '<leader>Gp', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = '[H]unk [P]revious' })

        -- Actions
        -- visual mode
        map('v', '<leader>Ghs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[H]unk [S]tage' })
        map('v', '<leader>Ghr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[H]unk [R]eset' })
        -- normal mode
        map('n', '<leader>Ghs', gitsigns.stage_hunk, { desc = '[H]unk [S]tage' })
        map('n', '<leader>Ghr', gitsigns.reset_hunk, { desc = '[H]unk [R]eset' })
        map('n', '<leader>GbS', gitsigns.stage_buffer, { desc = '[B]uffer [S]tage' })
        map('n', '<leader>Ghu', gitsigns.stage_hunk, { desc = '[H]unk [U]ndo stage' })
        map('n', '<leader>GbR', gitsigns.reset_buffer, { desc = '[B]uffer [R]eset' })
        map('n', '<leader>Ghp', gitsigns.preview_hunk, { desc = '[H]unk [P]review' })
        map('n', '<leader>Glb', gitsigns.blame_line, { desc = '[L]ine [B]lame' })
        map('n', '<leader>Gd', gitsigns.diffthis, { desc = '[D]iff against index' })
        map('n', '<leader>GD', function()
          gitsigns.diffthis '@'
        end, { desc = '[D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tGb', gitsigns.toggle_current_line_blame, { desc = '[L]ine [B]lame' })
        map('n', '<leader>tGD', gitsigns.preview_hunk_inline, { desc = '[D]eleted' })
      end,
    },
  },
}
