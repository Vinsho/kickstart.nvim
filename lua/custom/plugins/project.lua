return {
  'ahmedkhalf/project.nvim',
  version = '*',
  config = function()
    local project_nvim = require 'project_nvim'
    project_nvim.setup {
      sync_root_with_cwd = false,
      manual_mode = false,
      detection_methods = { 'pattern' },
      patterns = { ".git" },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
    }

    vim.keymap.set('n', '<leader>sp', [[<cmd>:Telescope projects<CR>]], { noremap = true, silent = true })
  end,
}
