require("toggleterm").setup{}

local term = require('toggleterm.terminal').Terminal:new({
  cmd = "",
  direction = 'float',
  hidden = true,
  count = 5,
})

local termExec = function(cmd, opt)
  if (opt and opt.args) then
    for _, v in pairs(opt.fargs) do
      cmd = cmd .. ' ' .. (v == '%' and vim.fn.expand('%') or v)
    end
  end
  print('toggleterm exec:', cmd)
  term.cmd = cmd
  term:toggle()
end

vim.api.nvim_create_user_command('G', function() termExec('lazygit') end, { nargs = 0 })
vim.api.nvim_create_user_command('Gblame', function() termExec('LESS= git blame ' .. vim.fn.expand('%:p')) end, { nargs = 0 })
vim.api.nvim_create_user_command('Glog', function() termExec('LESS= git log -p -- ' .. vim.fn.expand('%:p')) end, { nargs = 0 })
vim.api.nvim_create_user_command('Gdiff', function(opt) termExec('LESS= git diff', opt) end, { nargs = '*' })
