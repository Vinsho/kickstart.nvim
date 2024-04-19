require('mini.files').setup {}
_MINIFILES_TOGGLE = function()
  if not MiniFiles.close() then
    MiniFiles.open()
  end
end

vim.keymap.set('n', '<C-b>', [[<cmd>lua _MINIFILES_TOGGLE()<CR>]], { noremap = true, silent = true })
