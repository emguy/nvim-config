-- set vim variables -> let g:foo = bar --
vim.g.mapleader = ','
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local config_dir = vim.fn.stdpath('config')

-- set vim options -> :set --
vim.o.backup         = false
vim.o.cmdheight      = 2
vim.o.conceallevel   = 0
vim.o.cscopepathcomp = 3
vim.o.cscopetagorder = 0
vim.o.hidden         = true
vim.o.hlsearch       = false
vim.o.ignorecase     = false
vim.o.incsearch      = false
vim.o.laststatus     = 0
vim.o.lazyredraw     = true
vim.o.magic          = true
vim.o.modeline       = false
vim.o.mouse          = ''
vim.o.packpath       = config_dir .. '/packer'
vim.o.ruler          = true
vim.o.scrolloff      = 3
vim.o.secure         = true
vim.o.shadafile      = config_dir .. '/.cache/main.shada'
vim.o.shiftround     = true
vim.o.shortmess      = 'atI'
vim.o.showmatch      = true
vim.o.smartcase      = false
vim.o.splitbelow     = true
vim.o.splitright     = true
vim.o.startofline    = false
vim.o.swapfile       = false
vim.o.synmaxcol      = 200
vim.o.timeoutlen     = 600
vim.o.title          = true
vim.o.ttimeout       = true
vim.o.ttymouse       = ''
vim.o.undodir        = config_dir .. "/.cache/undofile"
vim.o.undolevels     = 1000
vim.o.updatetime     = 200
vim.o.whichwrap      = 'b,s,<,>,[,]'
vim.o.wildignorecase = true

-- buffer local --
vim.o.autoindent     = false
vim.o.cindent        = false
vim.o.expandtab      = true
vim.o.shiftwidth     = 2
vim.o.smartindent    = false
vim.o.softtabstop    = 2
vim.o.tabstop        = 2
vim.o.undofile       = true

-- window local --
vim.wo.number         = false
vim.wo.wrap           = false
vim.wo.cursorline     = true

-- packer --
local packer = require('packer')
packer.init {
  package_root = config_dir,
  compile_path = config_dir .. '/packer/packer_compiled.vim'
}
packer.startup({
  function()
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'neovim/nvim-lspconfig'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.4', requires = { {'nvim-lua/plenary.nvim'} } }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function() require("toggleterm").setup() end }
    use { 'williamboman/mason.nvim', run=":MasonUpdate" }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'chrisbra/Colorizer'
    use 'fatih/vim-go'
    use 'ntpeters/vim-better-whitespace'
    use 'hashivim/vim-terraform'
  end,
})

require('mason').setup()
require('modules.uischeme')
require('modules.lsp')
require('modules.nvimtree')
require('modules.cwdrooter')
require('modules.toggleterm')

-- keymaps --
vim.api.nvim_set_keymap('t', '<c-q>',     '<c-\\><c-n>', {noremap=true})
vim.api.nvim_set_keymap('n', '<c-p>',     '<cmd>bprevious<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<c-n>',     '<cmd>bnext<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>luafile ~/.config/nvim/init.lua<cr><cmd>echo "~/.config/nvim/init.lua is reloaded."<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>c', '<c-w>s<cmd>terminal<cr>i', {noremap=true})

-- telescope --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({cwd="~/git/", no_ignore_parent=true}) end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- customized commands --
vim.api.nvim_create_user_command('BD', 'bp|sp|bn|bd', {})

-- fix syntax highlighting for big files --
vim.api.nvim_create_autocmd('BufEnter', { pattern='*', command=[[ syntax sync fromstart ]]} )
-- disable automatic comment insertion --
vim.api.nvim_create_autocmd('BufEnter', { pattern='*', command=[[ setlocal formatoptions-=r  formatoptions-=o]]} )
-- fix indentation
vim.api.nvim_create_autocmd('BufEnter', { pattern='*.yaml,*.yml', command=[[ set indentkeys=e ]] })
-- move cursor to the last remembered position --
vim.api.nvim_create_autocmd('BufReadPost', { pattern='*', command=[[ if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]] })
-- fix 'ntpeters/vim-better-whitespace' on terminal mode --
vim.api.nvim_create_autocmd('TermOpen', { pattern='*', command=[[ DisableWhitespace ]]} )
