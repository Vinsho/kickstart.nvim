return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('flutter-tools').setup {
      fvm = true,
      lsp = {
        settings = {
          lineLength = 100,
          renameFilesWithClasses = 'always',
          documentation = 'full',
        },
      },
    }

    vim.keymap.set('n', '<leader>fc', ':Telescope flutter commands <CR>', { desc = 'Load Flutter commands' })
  end,
}
