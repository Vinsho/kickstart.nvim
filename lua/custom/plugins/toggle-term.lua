return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {--[[ things you want to change go here]]
  },
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<c-j>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
      shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
      direction = 'horizontal',
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell,
      auto_scroll = true, -- automatically scroll to the bottom on terminal output
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'n', 'C-j', _LAZYGIT_TOGGLE'n', 'C-j', _LAZYGIT_TO'n', 'C-j', _LAZYGIT_TOGGLEGGLE'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'curved',
      },
    }

    -- function _G.set_terminal_keymaps()
    --   local opts = { buffer = 0 }
    --   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    --   vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    --   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    --   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    --   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    --   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    --   vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    -- end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }
    local newTmux = Terminal:new { cmd = 'tmux', hidden = true, direction = 'float' }

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    function _NEW_TMUX_TOGGLE()
      newTmux:toggle()
    end

    vim.keymap.set({ 'n', 'i', 't' }, '<C-l>', [[<cmd>lua _LAZYGIT_TOGGLE()<CR>]], { noremap = true, silent = true })
    vim.keymap.set({ 'n', 't' }, '<C-k>', [[<cmd>lua _NEW_TMUX_TOGGLE()<CR>]], { noremap = true, silent = true })
  end,
}
