return {
  'hedyhli/outline.nvim',
  lazy = true,
  cmd = { 'Outline', 'OutlineOpen' },
  keys = { -- Example mapping to toggle outline
    { '<leader>l', '<cmd>Outline<CR>', desc = 'Toggle outline' },
  },
  opts = {
    outline_window = {
      auto_jump = true,
    },
  },
}

-- return {
--   'hedyhli/outline.nvim',
--   dependencies = {
--     'epheien/outline-ctags-provider.nvim',
--   },
--   lazy = true,
--   event = 'VeryLazy',
--   cmd = { 'Outline', 'OutlineOpen' },
--   keys = { -- Example mapping to toggle outline
--     { '<leader>l', '<cmd>Outline<CR>', desc = 'Toggle outline' },
--   },
--
--   config = function()
--     require('outline').setup {
--       outline_window = {
--         auto_jump = true,
--       },
--       providers = {
--         priority = { 'lsp', 'coc', 'markdown', 'norg', 'ctags' },
--         -- ctags provider options
--         ctags = {
--           program = 'ctags',
--           filetypes = {
--             ['c++'] = {
--               -- ...
--             },
--           },
--         },
--       },
--     }
--   end,
-- }
--
