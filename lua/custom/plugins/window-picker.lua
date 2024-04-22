return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  version = '2.*',
  config = function()
    local windowPicker = require 'window-picker'
    windowPicker.setup()
    function _PICK_WINDOW()
      windowPicker.pick_window {
        hint = 'floating-big-letter',
      }
    end

    vim.keymap.set('n', '<c-w>p', '<cmd>lua _PICK_WINDOW()<CR>', { desc = 'Pick window' })
  end,
}
