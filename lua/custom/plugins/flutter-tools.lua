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
      closing_tags = {
        prefix = '// ', -- character to use for close tag e.g. > Widget
        enabled = true, -- set to false to disable
      },
      lsp = {
        settings = {
          lineLength = 100,
          renameFilesWithClasses = 'always',
          enableSnippets = true,
          documentation = 'full',
          analysisExcludedFolders = { '.dart_tool/**', '.dart_plugins/**', 'build/**', 'ios/', 'android/', '$HOME/.pub-cache/**', '.fvm/**' },
        },
      },
      dev_log = {
        enabled = true,
        notify_errors = false, -- if there is an error whilst running then notify the user
        open_cmd = 'tabedit', -- command to use to open the log buffer
      },
    }

    -- .nvim.lua
    -- If you have more than one setup configured you will be prompted when you run
    -- your app to select which one you want to use
    require('flutter-tools').setup_project {
      {
        name = 'Dev simulator', -- an arbitrary name that you provide so you can recognise this config
        flavor = 'dev', -- your flavour
        target = 'lib/main.dart', -- your target
        dart_define = {
          environment = 'DEV',
        },
      },
      {
        name = 'Tally dev', -- an arbitrary name that you provide so you can recognise this config
        target = 'lib/main.dart', -- your target
      },
      {
        name = 'Web',
        device = 'chrome',
        flavor = 'WebApp',
        web_port = 4000,
      },
      {
        name = 'Profile',
        flutter_mode = 'profile', -- possible values: `debug`, `profile` or `release`, defaults to `debug`
      },
    }

    vim.keymap.set('n', '<leader>fc', ':Telescope flutter commands <CR>', { desc = 'Load Flutter commands' })
  end,
}
