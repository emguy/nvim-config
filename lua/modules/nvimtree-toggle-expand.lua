local core = require "nvim-tree.core"
local renderer = require "nvim-tree.renderer"
local Iterator = require "nvim-tree.iterators.node-iterator"
local notify = require "nvim-tree.notify"
local lib = require "nvim-tree.lib"

local M = {}

M.MAX_FOLDER_DISCOVERY=100

-- local function to_lookup_table(list)
--   local table = {}
--   for _, element in ipairs(list) do
--     table[element] = true
--   end
--   return table
-- end

local function expand(node)
  node = lib.get_last_group_node(node)
  node.open = true
  if #node.nodes == 0 then
    core.get_explorer():expand(node)
  end
end

local function collapse(node)
  node = lib.get_last_group_node(node)
  node.open = false
end

local function should_expand(expansion_count, node)
  local should_halt = expansion_count >= M.MAX_FOLDER_DISCOVERY
  -- local should_exclude = M.EXCLUDE[node.name]
  return not should_halt and node.nodes and not node.open and not should_exclude
end

local function should_collapse(expansion_count, node)
  local should_halt = expansion_count >= M.MAX_FOLDER_DISCOVERY
  -- local should_exclude = M.EXCLUDE[node.name]
  return not should_halt and node.nodes and node.open and not should_exclude
end

local function gen_collapse_iterator()
  local expansion_count = 0

  return function(parent)
    if parent.parent and parent.nodes and parent.open then
      expansion_count = expansion_count + 1
      collapse(parent)
    end

    Iterator.builder(parent.nodes)
      :hidden()
      :applier(function(node)
        if should_collapse(expansion_count, node) then
          expansion_count = expansion_count + 1
          collapse(node)
        end
      end)
      :recursor(function(node)
        return expansion_count < M.MAX_FOLDER_DISCOVERY and (node.group_next and { node.group_next } or (node.nodes))
      end)
      :iterate()

    if expansion_count >= M.MAX_FOLDER_DISCOVERY then
      return true
    end
  end
end

local function gen_expand_iterator()
  local expansion_count = 0

  return function(parent)
    if parent.parent and parent.nodes and not parent.open then
      expansion_count = expansion_count + 1
      expand(parent)
    end

    Iterator.builder(parent.nodes)
      :hidden()
      :applier(function(node)
        if should_expand(expansion_count, node) then
          expansion_count = expansion_count + 1
          expand(node)
        end
      end)
      :recursor(function(node)
        return expansion_count < M.MAX_FOLDER_DISCOVERY and (node.group_next and { node.group_next } or (node.open and node.nodes))
      end)
      :iterate()

    if expansion_count >= M.MAX_FOLDER_DISCOVERY then
      return true
    end
  end
end

function M.fn(base_node)
  local node = base_node.nodes and base_node or core.get_explorer()
  if node.open then
    if gen_collapse_iterator()(node) then
      notify.warn("expansion iteration was halted after " .. M.MAX_FOLDER_DISCOVERY .. " discovered folders")
    end
  else
    if gen_expand_iterator()(node) then
      notify.warn("expansion iteration was halted after " .. M.MAX_FOLDER_DISCOVERY .. " discovered folders")
    end
  end
  renderer.draw()
end

function M.wrap_fn(node)
  node = node or require("nvim-tree.lib").get_node_at_cursor()
  M.fn(node)
end

-- function M.setup(opts)
--   M.MAX_FOLDER_DISCOVERY = opts.actions.expand_all.max_folder_discovery
--   M.EXCLUDE = to_lookup_table(opts.actions.expand_all.exclude)
-- end

return M
