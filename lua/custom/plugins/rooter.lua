return {
  'airblade/vim-rooter',
  config = function()
    vim.g.rooter_patterns = { '.git' }

    -- nnoremap <expr> sp ':Telescope find_files cwd='.FindRootDirectory().'/<cr>'
  end,
}
