-- see https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('command! TR NvimTreeToggle')

local api = require("nvim-tree.api")
local view = require "nvim-tree.view"

local function open_file_without_focus(node)
  api.node.open.edit(node)
  api.tree.focus()
end

local function clear_buffer()
  local bufs = vim.fn.getbufinfo { bufloaded = 1, buflisted = 1 }
  for _, buf in pairs(bufs) do
    if buf.name == require("nvim-tree.lib").get_node_at_cursor().absolute_path then
      if buf.hidden == 0 and (#bufs > 1 or view.View.float.enable) then
        local winnr = vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(buf.windows[1])
        vim.cmd ":bn"
        if not view.View.float.enable then
          vim.api.nvim_set_current_win(winnr)
        end
      end
      vim.api.nvim_buf_delete(buf.bufnr, { force = true })
      return
    end
  end
end


local toggle_expand = require("nvimtree-toggle-expand").wrap_fn

local function my_on_attach(bufnr)
  local function opts(desc)
   return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- use all default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- copy default mappings here from defaults in next section
  vim.keymap.set('n', 'P', api.tree.change_root_to_parent, opts('Parent Dir'))
  vim.keymap.set('n', 'c', api.fs.create, opts('Create Node'))
  vim.keymap.set('n', 'y', api.fs.copy.node, opts('Copy Node'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste Node'))
  vim.keymap.set('n', 'x', clear_buffer, opts('Close Buff'))
  vim.keymap.set('n', 'o', open_file_without_focus, opts('Open File'))
  vim.keymap.set('n', 'O', toggle_expand, opts('Toggle node expansion'))
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
