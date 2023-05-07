-- see https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('command! TR NvimTreeToggle')

local nvimtree_api = require("nvim-tree.api")

local function open_file_without_focus(node)
  nvimtree_api.node.open.edit(node)
  nvimtree_api.tree.focus()
end

local function my_on_attach(bufnr)
  local function opts(desc)
   return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- use all default mappings
  nvimtree_api.config.mappings.default_on_attach(bufnr)

  -- copy default mappings here from defaults in next section
  vim.keymap.set('n', 'c', nvimtree_api.tree.change_root_to_node,          opts('Change Dir'))
  vim.keymap.set('n', 'P', nvimtree_api.tree.change_root_to_parent,          opts('Parent Dir'))
  vim.keymap.set('n', 'o', open_file_without_focus,          opts('Open File'))
  vim.keymap.set('n', 'O', nvimtree_api.tree.expand_all,          opts('Expand All'))
  vim.keymap.set('n', 'C', nvimtree_api.fs.create,          opts('Create Node'))
  vim.keymap.set('n', 'y', nvimtree_api.fs.copy.node,          opts('Copy Node'))
end

-- OR setup with some options
require("nvim-tree").setup({
  on_attach = my_on_attach,
  sync_root_with_cwd = true,
  disable_netrw = true,
  root_dirs = {'~/git', '~/.config/nvim'},
  sort_by = "case_sensitive",
  view = {
    width = 36,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  renderer = {
    group_empty = false,
    add_trailing = false,
    highlight_opened_files = "name",
    icons = {
      glyphs = {
        modified = "📍",
      }
    }
  },
  filters = {
    dotfiles = false, -- show dotfiles
  },
  git = {
    enable = false,
    ignore = false,
  },
  modified = {
    enable = true
  }
})
