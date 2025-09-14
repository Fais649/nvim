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
        map('n', 'gghn', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = '[G]oto [G]it [H]unk [N]ext' })

        map('n', 'gghp', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = '[G]oto [G]it [H]unk [P]revious' })

        -- Actions
        -- visual mode
        map('v', '<leader>mghs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[M]ake [G]it [H]unk [S]tage' })
        map('v', '<leader>mghr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[M]ake [G]it [H]unk [R]eset' })
        -- normal mode
        map('n', '<leader>mghs', gitsigns.stage_hunk, { desc = '[M]ake [G]it [H]unk [S]tage' })
        map('n', '<leader>mghr', gitsigns.reset_hunk, { desc = '[M]ake [G]it [H]unk [R]eset' })
        map('n', '<leader>mgbS', gitsigns.stage_buffer, { desc = '[M]ake [G]it [B]uffer [S]tage' })
        map('n', '<leader>mghu', gitsigns.stage_hunk, { desc = '[M]ake [G]it [H]unk [U]ndo stage' })
        map('n', '<leader>mgbR', gitsigns.reset_buffer, { desc = '[M]ake [G]it [B]uffer [R]eset' })
        map('n', '<leader>mghp', gitsigns.preview_hunk, { desc = '[M]ake [G]it [H]unk [P]review' })
        map('n', '<leader>mglb', gitsigns.blame_line, { desc = '[M]ake [G]it [L]ine [B]lame' })
        map('n', '<leader>mgd', gitsigns.diffthis, { desc = '[M]ake [G]it [D]iff against index' })
        map('n', '<leader>mgD', function()
          gitsigns.diffthis '@'
        end, { desc = '[M]ake [G]it [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tglb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle [G]it [L]ine [B]lame' })
        map('n', '<leader>tgD', gitsigns.preview_hunk_inline, { desc = '[T]oggle [G]it [D]eleted' })
      end,
    },
  },
}
