return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },

  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- ui configurations
    dapui.setup {
      layouts = {
        {
          elements = {
            'scopes',
            'breakpoints',
            'stacks',
            'watches',
          },
          size = 40,
          position = 'left',
        },
        {
          elements = {
            'repl',
            'console',
          },
          size = 10,
          position = 'bottom',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- adapters configurations
    dap.adapters.gdb = {
      type = 'executable',
      command = 'gdb',
      args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
    }

    dap.configurations.c = {
      {
        name = 'Launch',
        type = 'gdb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = {}, -- provide arguments if needed
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = 'Select and attach to process',
        type = 'gdb',
        request = 'attach',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pid = function()
          local name = vim.fn.input 'Executable name (filter): '
          return require('dap.utils').pick_process { filter = name }
        end,
        cwd = '${workspaceFolder}',
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'gdb',
        request = 'attach',
        target = 'localhost:1234',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
      },
    }
    dap.configurations.cpp = dap.configurations.c
    dap.configurations.rust = dap.configurations.c

    -- mappings
    -- Debug control
    vim.keymap.set('n', '<leader>bc', dap.continue, { desc = 'DAP: Start / Continue' })
    vim.keymap.set('n', '<leader>bn', dap.step_over, { desc = 'DAP: Step Over' })
    vim.keymap.set('n', '<leader>bs', dap.step_into, { desc = 'DAP: Step Into' })
    vim.keymap.set('n', '<leader>bf', dap.step_out, { desc = 'DAP: Step Out' })
    vim.keymap.set('n', '<leader>bq', dap.terminate, { desc = 'DAP: Terminate' })

    -- Breakpoints
    vim.keymap.set('n', '<leader>bb', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>bw', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'DAP: Conditional Breakpoint' })

    vim.keymap.set('n', '<leader>bl', function()
      dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
    end, { desc = 'DAP: Log Point' })

    -- UI
    vim.keymap.set('n', '<leader>bu', dapui.toggle, { desc = 'DAP: Toggle UI' })
    vim.keymap.set('n', '<leader>br', dap.repl.open, { desc = 'DAP: Open REPL' })
    vim.keymap.set('n', '<leader>bl', dap.run_last, { desc = 'DAP: Run Last' })

    -- Stack navigation
    vim.keymap.set('n', '<leader>bj', dap.down, { desc = 'DAP: Down Stack' })
    vim.keymap.set('n', '<leader>bk', dap.up, { desc = 'DAP: Up Stack' })

    -- Evaluation
    vim.keymap.set({ 'n', 'v' }, '<leader>be', function()
      require('dap.ui.widgets').hover()
    end, { desc = 'DAP: Evaluate' })
  end,
}
