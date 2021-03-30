require('modules.utils')
require('modules.uischeme')
local config_dir = vim.fn.stdpath('config')

vim.g.mapleader = ','

set_opt('b', 'autoindent',      false)
set_opt('b', 'cindent',         false)
set_opt('b', 'expandtab',       true)
set_opt('b', 'shiftwidth',      2)
set_opt('b', 'smartindent',     false)
set_opt('b', 'softtabstop',     2)
set_opt('b', 'tabstop',         2)
set_opt('b', 'undofile',        true)
set_opt('o', 'backup',          false)
set_opt('o', 'cmdheight',       2)
set_opt('o', 'conceallevel',    2)
set_opt('o', 'cscopepathcomp',  3)
set_opt('o', 'cscopetagorder',  0)
set_opt('o', 'hidden',          true)
set_opt('o', 'hlsearch',        false)
set_opt('o', 'ignorecase',      false)
set_opt('o', 'incsearch',       false)
set_opt('o', 'laststatus',      0)
set_opt('o', 'lazyredraw',      true)
set_opt('o', 'magic',           true)
set_opt('o', 'modeline',        false)
set_opt('o', 'packpath',        config_dir .. '/packer')
set_opt('o', 'ruler',           true)
set_opt('o', 'scrolloff',       3)
set_opt('o', 'secure',          true)
set_opt('o', 'shadafile',       config_dir .. '/.cache/main.shada')
set_opt('o', 'shiftround',      true)
set_opt('o', 'shortmess',       'atI')
set_opt('o', 'showmatch',       true)
set_opt('o', 'smartcase',       false)
set_opt('o', 'splitbelow',      true)
set_opt('o', 'splitright',      true)
set_opt('o', 'startofline',     false)
set_opt('o', 'swapfile',        false)
set_opt('o', 'synmaxcol',       200)
set_opt('o', 'timeoutlen',      600)
set_opt('o', 'title',           true)
set_opt('o', 'ttimeout',        true)
set_opt('o', 'undodir',         config_dir .. "/.cache/undofile")
set_opt('o', 'undolevels',      1000)
set_opt('o', 'updatetime',      200)
set_opt('o', 'whichwrap',       'b,s,<,>,[,]')
set_opt('o', 'wildignorecase',  true)
set_opt('w', 'number',          false)
set_opt('w', 'wrap',            false)
set_opt('w', 'cursorline',      true)

local packer = require('packer')
packer.init {
  package_root = config_dir,
  compile_path = config_dir .. '/packer/packer_compiled.vim'
}
packer.startup({
  function()
    use 'wbthomason/packer.nvim'
    use 'preservim/nerdtree'
    use 'martinda/Jenkinsfile-vim-syntax'
    use 'tpope/vim-fugitive'
    use 'vijaymarupudi/nvim-fzf'
    use 'chrisbra/Colorizer'
    use 'junegunn/fzf.vim'
  end,
})

noremap('t', '<c-q>', '<c-\\><c-n>')
noremap('n', '<c-p>',     '<cmd>bprevious<cr>')
noremap('n', '<c-n>',     '<cmd>bnext<cr>')
noremap('n', '<leader>f', '<cmd>lua require("fzf-commands.files")()<cr>')
noremap('n', '<leader>b', '<cmd>lua require("fzf-commands.bufferpicker")()<cr>')
noremap('n', '<leader>r', '<cmd>luafile ~/.config/nvim/init.lua<cr><cmd>echo "~/.config/nvim/init.lua is reloaded."<cr>')
noremap('n', '<leader>c', '<c-w>s<cmd>terminal<cr>i')

vim.cmd('command! BD :bp|sp|bn|bd')

-- move cursor to the last remembered position --
vim.cmd([[ autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

-- fix syntax highlighting for big files --
vim.cmd('autocmd BufEnter * syntax sync fromstart')
