return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- custom mappings
      vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts 'CD')
      vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, opts 'Open: In Place')
      vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts 'Info')
      vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts 'Rename: Omit Filename')
      vim.keymap.set('n', '<C-t>', api.node.open.tab, opts 'Open: New Tab')
      vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts 'Open: Vertical Split')
      vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts 'Open: Horizontal Split')
      vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts 'Close Directory')
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts 'Open')
      vim.keymap.set('n', '<Tab>', api.node.open.preview, opts 'Open Preview')
      vim.keymap.set('n', '<leader>d>', api.node.navigate.sibling.next, opts 'Next Sibling')
      vim.keymap.set('n', '<leader>d<', api.node.navigate.sibling.prev, opts 'Previous Sibling')
      vim.keymap.set('n', '<leader>d.', api.node.run.cmd, opts 'Run Command')
      vim.keymap.set('n', '<leader>d-', api.tree.change_root_to_parent, opts 'Up')
      vim.keymap.set('n', '<leader>da', api.fs.create, opts 'Create File Or Directory')
      vim.keymap.set('n', '<leader>dbd', api.marks.bulk.delete, opts 'Delete Bookmarked')
      vim.keymap.set('n', '<leader>dbt', api.marks.bulk.trash, opts 'Trash Bookmarked')
      vim.keymap.set('n', '<leader>dbmv', api.marks.bulk.move, opts 'Move Bookmarked')
      vim.keymap.set('n', '<leader>dB', api.tree.toggle_no_buffer_filter, opts 'Toggle Filter: No Buffer')
      vim.keymap.set('n', '<leader>dc', api.fs.copy.node, opts 'Copy')
      vim.keymap.set('n', '<leader>dC', api.tree.toggle_git_clean_filter, opts 'Toggle Filter: Git Clean')
      vim.keymap.set('n', '<leader>d[c', api.node.navigate.git.prev, opts 'Prev Git')
      vim.keymap.set('n', '<leader>d]c', api.node.navigate.git.next, opts 'Next Git')
      vim.keymap.set('n', '<leader>dd', api.fs.remove, opts 'Delete')
      vim.keymap.set('n', '<leader>dD', api.fs.trash, opts 'Trash')
      vim.keymap.set('n', '<leader>dE', api.tree.expand_all, opts 'Expand All')
      vim.keymap.set('n', '<leader>de', api.fs.rename_basename, opts 'Rename: Basename')
      vim.keymap.set('n', '<leader>d]e', api.node.navigate.diagnostics.next, opts 'Next Diagnostic')
      vim.keymap.set('n', '<leader>d[e', api.node.navigate.diagnostics.prev, opts 'Prev Diagnostic')
      vim.keymap.set('n', '<leader>dF', api.live_filter.clear, opts 'Live Filter: Clear')
      vim.keymap.set('n', '<leader>df', api.live_filter.start, opts 'Live Filter: Start')
      vim.keymap.set('n', '<leader>d?', api.tree.toggle_help, opts 'Help')
      vim.keymap.set('n', '<leader>dgy', api.fs.copy.absolute_path, opts 'Copy Absolute Path')
      vim.keymap.set('n', '<leader>dge', api.fs.copy.basename, opts 'Copy Basename')
      vim.keymap.set('n', '<leader>dH', api.tree.toggle_hidden_filter, opts 'Toggle Filter: Dotfiles')
      vim.keymap.set('n', '<leader>dI', api.tree.toggle_gitignore_filter, opts 'Toggle Filter: Git Ignore')
      vim.keymap.set('n', '<leader>dJ', api.node.navigate.sibling.last, opts 'Last Sibling')
      vim.keymap.set('n', '<leader>dK', api.node.navigate.sibling.first, opts 'First Sibling')
      vim.keymap.set('n', '<leader>dL', api.node.open.toggle_group_empty, opts 'Toggle Group Empty')
      vim.keymap.set('n', '<leader>dM', api.tree.toggle_no_bookmark_filter, opts 'Toggle Filter: No Bookmark')
      vim.keymap.set('n', '<leader>dm', api.marks.toggle, opts 'Toggle Bookmark')
      vim.keymap.set('n', '<leader>do', api.node.open.edit, opts 'Open')
      vim.keymap.set('n', '<leader>dO', api.node.open.no_window_picker, opts 'Open: No Window Picker')
      vim.keymap.set('n', '<leader>dp', api.fs.paste, opts 'Paste')
      vim.keymap.set('n', '<leader>dP', api.node.navigate.parent, opts 'Parent Directory')
      vim.keymap.set('n', '<leader>dq', api.tree.close, opts 'Close')
      vim.keymap.set('n', '<leader>dr', api.fs.rename, opts 'Rename')
      vim.keymap.set('n', '<leader>dR', api.tree.reload, opts 'Refresh')
      vim.keymap.set('n', '<leader>ds', api.node.run.system, opts 'Run System')
      vim.keymap.set('n', '<leader>dS', api.tree.search_node, opts 'Search')
      vim.keymap.set('n', '<leader>du', api.fs.rename_full, opts 'Rename: Full Path')
      vim.keymap.set('n', '<leader>dU', api.tree.toggle_custom_filter, opts 'Toggle Filter: Hidden')
      vim.keymap.set('n', '<leader>dW', api.tree.collapse_all, opts 'Collapse All')
      vim.keymap.set('n', '<leader>dx', api.fs.cut, opts 'Cut')
      vim.keymap.set('n', '<leader>dy', api.fs.copy.filename, opts 'Copy Name')
      vim.keymap.set('n', '<leader>dY', api.fs.copy.relative_path, opts 'Copy Relative Path')
    end
    require('nvim-tree').setup {
      on_attach = my_on_attach,
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    }
  end,
}
