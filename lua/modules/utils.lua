function set_opt(scope, key, value)
  vim.o[key] = value
  if scope ~= 'o' then vim[scope:sub(1,1) .. 'o'][key] = value end
end

function noremap(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
