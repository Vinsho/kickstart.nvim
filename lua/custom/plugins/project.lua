return {
  'ahmedkhalf/project.nvim',
  version = '*',
  config = function()
    local project_nvim = require 'project_nvim'
    project_nvim.setup {}

    vim.keymap.set('n', '<leader>sp', [[<cmd>:Telescope projects<CR>]], { noremap = true, silent = true })
  end,
}
