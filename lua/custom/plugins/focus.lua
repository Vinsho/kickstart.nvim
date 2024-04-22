return {
  'nvim-focus/focus.nvim',
  version = false,
  config = function()
    require('focus').setup()

    vim.keymap.set('n', '<c-w>s', function()
      require('focus').split_nicely()
    end, { desc = 'split nicely' })
  end,
}
