return {
  'Aietes/esp32.nvim',
  keys = {
    {
      -- some other keymap
      '<leader>em',
      function()
        require('esp32').pick 'monitor'
      end,
      desc = 'ESP32: Pick & Monitor',
    },
  },
}
