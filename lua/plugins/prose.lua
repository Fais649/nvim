return {
  'skwee357/nvim-prose',
  config = function()
    require('nvim-prose').setup {
      wpm = 100.0,
      filetypes = { 'markdown', 'asciidoc' },
      placeholders = {
        words = 'w',
        minutes = 'm',
      },
    }
  end,
}
