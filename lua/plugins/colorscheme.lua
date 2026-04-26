return {
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      filetypes = { '*' }, -- filetypes to highlight, "*" for all
      buftypes = {}, -- buftypes to highlight
      user_commands = true, -- enable user commands (ColorizerToggle, etc.)
      lazy_load = false, -- lazily schedule buffer highlighting
      options = {
        parsers = {
          css = false, -- preset: enables names, hex, rgb, hsl, oklch, css_var
          css_fn = false, -- preset: enables rgb, hsl, oklch
          names = {
            enable = false, -- enable named colors (e.g. "Blue")
            lowercase = true, -- match lowercase names
            camelcase = true, -- match CamelCase names (e.g. "LightBlue")
            uppercase = false, -- match UPPERCASE names
            strip_digits = false, -- ignore names with trailing digits (e.g. "blue3")
            custom = false, -- custom name-to-hex mappings; table|function|false
            extra_word_chars = '-', -- extra chars treated as part of color name
          },
          hex = {
            default = true, -- default value for unset format keys (see above)
            rgb = true, -- #RGB (3-digit)
            rgba = true, -- #RGBA (4-digit)
            rrggbb = true, -- #RRGGBB (6-digit)
            rrggbbaa = true, -- #RRGGBBAA (8-digit)
            hash_aarrggbb = true, -- #AARRGGBB (QML-style, alpha first)
            aarrggbb = false, -- 0xAARRGGBB
            no_hash = false, -- hex without '#' at word boundaries
          },
          rgb = { enable = true }, -- rgb()/rgba() functions
          hsl = { enable = true }, -- hsl()/hsla() functions
          oklch = { enable = true }, -- oklch() function
          hwb = { enable = true }, -- hwb() function (CSS Color Level 4)
          lab = { enable = true }, -- lab() function (CIE Lab)
          lch = { enable = true }, -- lch() function (CIE LCH)
          css_color = { enable = true }, -- color() function (srgb, display-p3, a98-rgb, etc.)
          tailwind = {
            enable = true, -- parse Tailwind color names
            update_names = false, -- feed LSP colors back into name parser (requires both enable + lsp.enable)
            lsp = { -- accepts boolean, true is shortcut for { enable = true, disable_document_color = true }
              enable = false, -- use Tailwind LSP documentColor
              disable_document_color = true, -- auto-disable vim.lsp.document_color on attach
            },
          },
          sass = {
            enable = false, -- parse Sass color variables
            parsers = { css = true }, -- parsers for resolving variable values
            variable_pattern = '^%$([%w_-]+)', -- Lua pattern for variable names
          },
          xterm = { enable = true }, -- xterm 256-color codes (#xNN, \e[38;5;NNNm)
          xcolor = { enable = false }, -- LaTeX xcolor expressions (e.g. red!30)
          hsluv = { enable = false }, -- hsluv()/hsluvu() functions
          css_var_rgb = { enable = false }, -- CSS vars with R,G,B (e.g. --color: 240,198,198)
          css_var = {
            enable = false, -- resolve var(--name) references to their defined color
            parsers = { css = true }, -- parsers for resolving variable values
          },
          custom = {}, -- list of custom parser definitions
        },
        display = {
          mode = 'background', -- string or list: "background"|"foreground"|"underline"|"virtualtext"
          background = {
            bright_fg = '#000000', -- text color on bright backgrounds
            dark_fg = '#ffffff', -- text color on dark backgrounds
          },
          virtualtext = {
            char = '■', -- character used for virtualtext
            position = 'eol', -- "eol"|"before"|"after"
            hl_mode = 'foreground', -- "background"|"foreground"
          },
          priority = {
            default = 150, -- extmark priority for normal highlights
            lsp = 200, -- extmark priority for LSP/Tailwind highlights
          },
          disable_document_color = true, -- true (all LSPs) | false | { lsp_name = true, ... }
        },
        hooks = {
          should_highlight_line = false, -- function(line, bufnr, line_num) -> bool
          should_highlight_color = false, -- function(rgb_hex, parser_name, ctx) -> bool
          transform_color = false, -- function(rgb_hex, ctx) -> string
          on_attach = false, -- function(bufnr, opts)
          on_detach = false, -- function(bufnr)
        },
        always_update = false, -- update highlights even in unfocused buffers
        debounce_ms = 0, -- debounce highlight updates (ms); 0 = no debounce
      },
    },
  },
  {

    'scottmckendry/cyberdream.nvim',
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        -- Set light or dark variant
        variant = 'default', -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

        -- Enable transparent background
        transparent = false,

        -- Reduce the overall saturation of colours for a more muted look
        saturation = 0.5, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

        -- Enable italics comments
        italic_comments = false,

        -- Replace all fillchars with ' ' for the ultimate clean look
        hide_fillchars = true,

        -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
        borderless_pickers = false,

        -- Set terminal colors used in `:terminal`
        terminal_colors = true,
        -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
        cache = false,

        -- Override highlight groups with your own colour values
        -- highlights = {
        --   -- Highlight groups to override, adding new groups is also possible
        --   -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values
        --
        --   -- Example:
        --   Comment = { fg = 'NONE', bg = '#696969', italic = true },
        --
        --   -- More examples can be found in `lua/cyberdream/extensions/*.lua`
        -- },

        -- Override a highlight group entirely using the built-in colour palette
        -- overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
        --   -- Example:
        --   return {
        --     Comment = { fg = colors.green, bg = 'NONE', italic = true },
        --     ['@property'] = { fg = colors.magenta, bold = true },
        --   }
        -- end,

        -- Override colors
        colors = {
          -- For a list of colors see `lua/cyberdream/colours.lua`

          -- Override colors for both light and dark variants
          bg = '#000000',
          green = '#a0e057',
          magenta = '#bb57e0',
          fg = '#cccccc',
          red = '#ff6e5e',
          cyan = '#57c9e0',
          -- If you want to override colors for light or dark variants only, use the following format:
          light = {
            red = '#ff5c57',
            cyan = '#5ef1ff',
          },
        },

        extensions = {
          default = true,
          base = true,
        },
      }
      vim.cmd 'colorscheme cyberdream'
    end,
  },
  {
    'vague2k/vague.nvim',
    enabled = false,
    config = function()
      require('vague').setup {
        transparent = false, -- If true, background is not set
        bold = true, -- Disable bold globally
        italic = true, -- Disable italic globally
        on_highlights = function(hl, colors) end,
        colors = {
          bg = '#000000',
          inactiveBg = '#000000',
          fg = '#cdcdcd',
          floatBorder = '#000000',
          line = '#252530',
          comment = '#606079',
          builtin = '#b4d4cf',
          func = '#c48282',
          string = '#e8b589',
          number = '#e0a363',
          property = '#c3c3d5',
          constant = '#aeaed1',
          parameter = '#bb9dbd',
          visual = '#333738',
          error = '#d8647e',
          warning = '#f3be7c',
          hint = '#7e98e8',
          operator = '#90a0b5',
          keyword = '#6e94b2',
          type = '#9bb4bc',
          search = '#405065',
          plus = '#7fa563',
          delta = '#f3be7c',
        },
      }

      vim.cmd.colorscheme 'vague'
    end,
  },
}
