return {
  'dhananjaylatkar/cscope_maps.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim', -- optional [for picker="telescope"]
    'ibhagwan/fzf-lua', -- optional [for picker="fzf-lua"]
    'echasnovski/mini.pick', -- optional [for picker="mini-pick"]
    'folke/snacks.nvim', -- optional [for picker="snacks"]
  },
  config = function()
    require('cscope_maps').setup()

    vim.keymap.set({ 'n', 'v' }, '<leader>cy', '<cmd>CsPrompt g<cr>', { desc = 'Find this global defintion' })

    vim.keymap.set(
      { 'n', 'v' },
      '<leader>cn',
      '<cmd>CsStackView open down<cr>',
      { desc = 'Opens "downward" stack showing all the functions who call the <sym>.' }
    )
    vim.keymap.set({ 'n', 'v' }, '<leader>cp', '<cmd>CsStackView open up<cr>', { desc = 'Opens "upward" stack showing all the functions called by the <sym>.' })
  end,

  opts = {
    -- USE EMPTY FOR DEFAULT OPTIONS
    -- DEFAULTS ARE LISTED BELOW
  },
}
