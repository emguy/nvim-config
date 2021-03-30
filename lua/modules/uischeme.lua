vim.cmd('syntax reset')

---------------------------------------------------------------
--
-- (1) predefined 28 terminal colors (syntax.c)
-- 
--     black       white            brown       none
--     grey        lightgrey        darkgrey
--     gray        lightgray        darkgray
--     blue        lightblue        darkblue
--     green       lightgreen       darkgreen
--     cyan        lightcyan        darkcyan
--     red         lightred         darkred
--     magenta     lightmagenta     darkmagenta
--     yellow      lightyellow      darkyellow
--
---------------------------------------------------------------

local set_color_scheme = function(scheme)
  for k1 in pairs(scheme) do
    local cmd = 'hi ' .. k1
    for k2 in pairs(scheme[k1]) do
      if scheme[k1][k2]:len() > 0 then
        cmd = cmd .. ' ' .. k2 .. '=' .. scheme[k1][k2]
      end
    end
    vim.cmd(cmd)
  end
end

local default_scheme = {
  Normal        = {ctermfg='gray',       ctermbg='none',        cterm='',               guifg='#c0c0c0',   guibg='#000040'},
  ErrorMsg      = {ctermfg='white',      ctermbg='blue',        cterm='',               guifg='#ffffff',   guibg='#287eff'},
  Visual        = {ctermfg='blue',       ctermbg='white',       cterm='reverse',        guifg='#8080ff',   guibg='#8080ff', gui='reverse'},
  Todo          = {ctermfg='red',        ctermbg='darkblue',    cterm='',               guifg='#d14a14',   guibg='#1248d1'},
  Search        = {ctermfg='white',      ctermbg='darkblue',    cterm='underline',      guifg='#90fff0',   guibg='#2050d0'},
  IncSearch     = {ctermfg='darkblue',   ctermbg='gray',        cterm='underline',      guifg='#b0ffff',   guibg='#2050d0', term='reverse'},

  SpecialKey    = {ctermfg='darkcyan',   ctermbg='none',        cterm='',               guifg='cyan',      guibg=''},
  Directory     = {ctermfg='cyan',       ctermbg='none',        cterm='',               guifg='cyan',      guibg=''},
  Title         = {ctermfg='magenta',    ctermbg='none',        cterm='bold',           guifg='magenta',   guibg=''},
  WarningMsg    = {ctermfg='red',        ctermbg='none',        cterm='',               guifg='red',       guibg=''},
  WildMenu      = {ctermfg='yellow',     ctermbg='none',        cterm='',               guifg='yellow',    guibg=''},
  ModeMsg       = {ctermfg='lightblue',  ctermbg='none',        cterm='',               guifg='#22cce2',   guibg=''},
  MoreMsg       = {ctermfg='darkgreen',  ctermbg='none',        cterm='',               guifg='',          guibg=''},
  Question      = {ctermfg='green',      ctermbg='none',        cterm='',               guifg='green',     guibg=''},
  NonText       = {ctermfg='darkblue',   ctermbg='none',        cterm='',               guifg='#0030ff',   guibg=''},

  Folded        = {ctermfg='darkgrey',   ctermbg='none',        cterm='bold',           guifg='#808080',   guibg='#000040', term='bold'},
  FoldColumn    = {ctermfg='darkgrey',   ctermbg='none',        cterm='bold',           guifg='#808080',   guibg='#000040', term='bold'},
  LineNr        = {ctermfg='darkyellow',      ctermbg='none',        cterm='',               guifg='#90f020',   guibg=''},
  CursorLineNr  = {ctermfg='green',      ctermbg='none',        cterm='',              guifg='red',       guibg='none'},
  CursorLine    = {ctermfg='none',       ctermbg='234',         cterm='none',           guifg='none',      guibg='none'},

  DiffAdd       = {ctermfg='',           ctermbg='darkblue',    cterm='',               guifg='',          guibg='darkblue'},
  DiffChange    = {ctermfg='',           ctermbg='magenta',     cterm='',               guifg='',          guibg='darkmagenta'},
  DiffDelete    = {ctermfg='blue',       ctermbg='cyan',        cterm='',               guifg='blue',      guibg='DarkCyan', gui='bold'},
  DiffText      = {ctermfg='',           ctermbg='red',         cterm='bold',           guifg='',          guibg='Red', gui='bold'},

  Cursor        = {ctermfg='black',      ctermbg='yellow',      cterm='',               guifg='black',     guibg='yellow'},
  lCursor       = {ctermfg='black',      ctermbg='white',       cterm='',               guifg='black',     guibg='white'},

  String        = {ctermfg='magenta',    ctermbg='none',        cterm='',               guifg='#80a0ff',   guibg=''},
  Comment       = {ctermfg='darkred',    ctermbg='none',        cterm='',               guifg='#80a0ff',   guibg=''},
  Constant      = {ctermfg='magenta',    ctermbg='none',        cterm='',               guifg='#ffa0a0',   guibg=''},
  Special       = {ctermfg='brown',      ctermbg='none',        cterm='',               guifg='Orange',    guibg=''},
  Identifier    = {ctermfg='cyan',       ctermbg='none',        cterm='',               guifg='#40ffff',   guibg=''},
  Statement     = {ctermfg='yellow',     ctermbg='none',        cterm='',               guifg='#ffff60',   guibg=''},
  PreProc       = {ctermfg='magenta',    ctermbg='none',        cterm='',               guifg='#ff80ff',   guibg=''},
  type          = {ctermfg='green',      ctermbg='none',        cterm='',               guifg='#60ff60',   guibg=''},
  Underlined    = {ctermfg='',           ctermbg='none',        cterm='underline',      guifg='',          guibg='', term='underline'},
  Ignore        = {ctermfg='',           ctermbg='none',        cterm='',               guifg=''  ,        guibg='none'},

  StatusLine    = {ctermfg='lightgreen', ctermbg='none',        cterm='underline,bold', guifg='lightgreen',guibg='black'},
  StatusLineNC  = {ctermfg='white',      ctermbg='none',        cterm='underline',      guifg='white',     guibg='black'},
  VertSplit     = {ctermfg='black',      ctermbg='white',       cterm='',               guifg='white',     guibg='black'},

  Pmenu         = {ctermfg='white',      ctermbg='none',         cterm='',               guifg='#ff80ff',   guibg=''},
  PmenuSel      = {ctermfg='green',      ctermbg='none',        cterm='',               guifg='#60ff60',   guibg=''},
  PmenuSbar     = {ctermfg='67',         ctermbg='none',        cterm='underline',      guifg='',          guibg='', term='underline'},
  PmenuThumb    = {ctermfg='',           ctermbg='none',        cterm='',               guifg=''  ,        guibg='none'},
}

set_color_scheme(default_scheme)
