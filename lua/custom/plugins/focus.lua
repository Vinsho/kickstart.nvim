return {
  'nvim-focus/focus.nvim',
  version = false,
  config = function()
    require('focus').setup { autoresize = { enable = false } }
    vim.keymap.set('n', '<c-w>s', function()
      require('focus').split_nicely()
    end, { desc = 'split nicely' })
  end,
}
