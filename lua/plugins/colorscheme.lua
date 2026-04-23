return {
  'scottmckendry/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('cyberdream').setup {
      -- Set light or dark variant
      variant = 'default', -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

      -- Enable transparent background
      transparent = false,

      -- Reduce the overall saturation of colours for a more muted look
      saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

      -- Enable italics comments
      italic_comments = false,

      -- Replace all fillchars with ' ' for the ultimate clean look
      hide_fillchars = false,

      -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
      borderless_pickers = false,

      -- Set terminal colors used in `:terminal`
      terminal_colors = true,

      -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
      cache = false,

      -- Override highlight groups with your own colour values
      highlights = {
        -- Highlight groups to override, adding new groups is also possible
        -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

        -- Example:
        Comment = { fg = '#696969', bg = 'NONE', italic = true },

        -- More examples can be found in `lua/cyberdream/extensions/*.lua`
      },

      -- Override a highlight group entirely using the built-in colour palette
      overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
        -- Example:
        return {
          Comment = { fg = colors.green, bg = 'NONE', italic = true },
          ['@property'] = { fg = colors.magenta, bold = true },
        }
      end,

      -- Override colors
      colors = {
        -- For a list of colors see `lua/cyberdream/colours.lua`

        -- Override colors for both light and dark variants
        bg = '#000000',
        green = '#00ff00',

        -- If you want to override colors for light or dark variants only, use the following format:
        dark = {
          magenta = '#ff00ff',
          fg = '#eeeeee',
        },
        light = {
          red = '#ff5c57',
          cyan = '#5ef1ff',
        },
      },

      extensions = {
        telescope = true,
        notify = true,
        mini = true,
      },

      -- Alternatively, you can use 'default' to set all extensions at once
      -- cache = true, -- Use cache for fastest loads
      -- extensions = {
      --     default = false, -- Disable all by default
      --     base = true, -- Enable all built-in hl groups (you probably want this)
      --
      --     -- Now enable only what you want to use
      --     telescope = true,
      --     cmp = true,
      --     gitsigns = true,
      -- },
    }
    vim.cmd 'colorscheme cyberdream'
  end,
}

-- return {
--   'vague2k/vague.nvim',
--   config = function()
--     require('vague').setup {
--       transparent = false, -- don't set background
--       -- disable bold/italic globally in `style`
--       bold = true,
--       italic = true,
--       style = {
--         -- "none" is the same thing as default. But "italic" and "bold" are also valid options
--         boolean = 'bold',
--         number = 'none',
--         float = 'none',
--         error = 'bold',
--         comments = 'italic',
--         conditionals = 'none',
--         functions = 'none',
--         headings = 'bold',
--         operators = 'none',
--         strings = 'italic',
--         variables = 'none',
--
--         -- keywords
--         keywords = 'none',
--         keyword_return = 'italic',
--         keywords_loop = 'none',
--         keywords_label = 'none',
--         keywords_exception = 'none',
--
--         -- builtin
--         builtin_constants = 'bold',
--         builtin_functions = 'none',
--         builtin_types = 'bold',
--         builtin_variables = 'none',
--       },
--       -- plugin styles where applicable
--       -- make an issue/pr if you'd like to see more styling options!
--       plugins = {
--         cmp = {
--           match = 'bold',
--           match_fuzzy = 'bold',
--         },
--         dashboard = {
--           footer = 'italic',
--         },
--         lsp = {
--           diagnostic_error = 'bold',
--           diagnostic_hint = 'none',
--           diagnostic_info = 'italic',
--           diagnostic_ok = 'none',
--           diagnostic_warn = 'bold',
--         },
--         neotest = {
--           focused = 'bold',
--           adapter_name = 'bold',
--         },
--         telescope = {
--           match = 'bold',
--         },
--       },
--
--       on_highlights = function(highlights, colors) end,
--
--       -- Override colors
--       colors = {
--         bg = '#000',
--         inactiveBg = '#000',
--         fg = '#cccccc',
--         floatBorder = '#878787',
--         line = '#252530',
--         comment = '#606060',
--         builtin = '#b4d4cf',
--         func = '#c48282',
--         string = '#e8b589',
--         number = '#e0a363',
--         property = '#c3c3d5',
--         constant = '#aeaed1',
--         parameter = '#bb9dbd',
--         visual = '#333738',
--         error = '#d8647e',
--         warning = '#f3be7c',
--         hint = '#7e98e8',
--         operator = '#90a0b5',
--         keyword = '#6e94b2',
--         type = '#9bb4bc',
--         search = '#405065',
--         plus = '#7fa563',
--         delta = '#f3be7c',
--       },
--     }
--
--     vim.cmd.colorscheme 'vague'
--   end,
-- }
