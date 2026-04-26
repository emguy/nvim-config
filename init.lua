-- set vim variables -> let g:foo = bar --
vim.g.mapleader = ','
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local config_dir = vim.fn.stdpath('config')

-- set vim options -> :set --
vim.opt.termguicolors = false

vim.o.backup         = false
vim.o.cmdheight      = 2
vim.o.conceallevel   = 0
-- vim.o.cscopepathcomp = 3
-- vim.o.cscopetagorder = 0
vim.o.hidden         = true
vim.o.hlsearch       = false
vim.o.ignorecase     = false
vim.o.incsearch      = false
vim.o.laststatus     = 0
vim.o.lazyredraw     = true
vim.o.magic          = true
vim.o.modeline       = false
vim.o.mouse          = ''
-- vim.o.packpath       = config_dir .. '/packer'
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
-- vim.o.ttymouse       = ''
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

-- lazy.nvim bootstrap --
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { "mason-org/mason.nvim", opts = {} },
  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'neovim/nvim-lspconfig' },
  { 'nvim-telescope/telescope.nvim' },
  { 'akinsho/toggleterm.nvim', version = '*' },
  { 'sindrets/diffview.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'chrisbra/Colorizer' },
  { 'fatih/vim-go' },
  { 'ntpeters/vim-better-whitespace' },
  { 'hashivim/vim-terraform' },
  { 'nvim-treesitter/nvim-treesitter', lazy = false, build = ':TSUpdate' }
}, {
  root = vim.fn.stdpath('data') .. '/lazy',
})

require('modules.nvimtree')
require('modules.cwdrooter')
require('modules.toggleterm')

require('modules.uischeme')

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

----------------
-- lsp        --
----------------
-- check ~/.local/share/nvim/lazy/nvim-lspconfig/lsp
vim.lsp.enable({
  -- lua
  "luals",
  -- python
  "pyright",
  -- markdown
  -- yaml
  "yamlls",
  -- bash
  "bashls",
  -- helm
  "helm_ls",
  -- golang
  "gopls",
  -- markdown/tex
  "ltex"
})
-- register custom yaml filetypes --
vim.filetype.add({
  pattern = {
    ['.*/.gitlab%-ci.*%.ya?ml'] = 'yaml.gitlab',
    ['.*/templates/.*%.ya?ml'] = 'yaml.helm',
    ['.*helmfile.*%.ya?ml'] = 'yaml.helm',
    ['.*/values.*%.ya?ml'] = 'yaml.helm-values',
    ['docker%-compose.*%.ya?ml'] = 'yaml.docker-compose',
    ['compose.*%.ya?ml'] = 'yaml.docker-compose',
  },
})
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
----------------
-- treesitter --
----------------
-- github: https://github.com/nvim-treesitter/nvim-treesitter
require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'yaml', 'bash' }
vim.api.nvim_create_autocmd('FileType', { pattern = { 'yaml', 'yaml.*', 'yml', 'sh' }, callback = function() vim.treesitter.start() end })
