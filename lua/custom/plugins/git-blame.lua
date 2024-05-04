return {
  'f-person/git-blame.nvim',
  name = 'gitblame',
  config = function()
    require('gitblame').setup {
      enabled = true,
    }

    vim.keymap.set('n', '<leader>gb', ':GitBlameToggle<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>go', ':GitBlameOpenCommitURL<CR>', { noremap = true, silent = true })

  end,
}
