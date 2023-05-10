local cmap = {
  ['*000000']=000, ['#800000']=001, ['#008000']=002, ['#808000']=003, ['#000080']=004, ['#800080']=005, ['#008080']=006, ['#C0C0C0']=007,
  ['*808080']=008, ['*FF0000']=009, ['*00FF00']=010, ['*FFFF00']=011, ['*0000FF']=012, ['*FF00FF']=013, ['*00FFFF']=014, ['*FFFFFF']=015,
  ['#000000']=016, ['#00005F']=017, ['#000087']=018, ['#0000AF']=019, ['#0000D7']=020, ['#0000FF']=021,
  ['#005F00']=022, ['#005F5F']=023, ['#005F87']=024, ['#005FAF']=025, ['#005FD7']=026, ['#005FFF']=027,
  ['#008700']=028, ['#00875F']=029, ['#008787']=030, ['#0087AF']=031, ['#0087D7']=032, ['#0087FF']=033,
  ['#00AF00']=034, ['#00AF5F']=035, ['#00AF87']=036, ['#00AFAF']=037, ['#00AFD7']=038, ['#00AFFF']=039,
  ['#00D700']=040, ['#00D75F']=041, ['#00D787']=042, ['#00D7AF']=043, ['#00D7D7']=044, ['#00D7FF']=045,
  ['#00FF00']=046, ['#00FF5F']=047, ['#00FF87']=048, ['#00FFAF']=049, ['#00FFD7']=050, ['#00FFFF']=051,
  ['#5F0000']=052, ['#5F005F']=053, ['#5F0087']=054, ['#5F00AF']=055, ['#5F00D7']=056, ['#5F00FF']=057,
  ['#5F5F00']=058, ['#5F5F5F']=059, ['#5F5F87']=060, ['#5F5FAF']=061, ['#5F5FD7']=062, ['#5F5FFF']=063,
  ['#5F8700']=064, ['#5F875F']=065, ['#5F8787']=066, ['#5F87AF']=067, ['#5F87D7']=068, ['#5F87FF']=069,
  ['#5FAF00']=070, ['#5FAF5F']=071, ['#5FAF87']=072, ['#5FAFAF']=073, ['#5FAFD7']=074, ['#5FAFFF']=075,
  ['#5FD700']=076, ['#5FD75F']=077, ['#5FD787']=078, ['#5FD7AF']=079, ['#5FD7D7']=080, ['#5FD7FF']=081,
  ['#5FFF00']=082, ['#5FFF5F']=083, ['#5FFF87']=084, ['#5FFFAF']=085, ['#5FFFD7']=086, ['#5FFFFF']=087,
  ['#870000']=088, ['#87005F']=089, ['#870087']=090, ['#8700AF']=091, ['#8700D7']=092, ['#8700FF']=093,
  ['#875F00']=094, ['#875F5F']=095, ['#875F87']=096, ['#875FAF']=097, ['#875FD7']=098, ['#875FFF']=099,
  ['#878700']=100, ['#87875F']=101, ['#878787']=102, ['#8787AF']=103, ['#8787D7']=104, ['#8787FF']=105,
  ['#87AF00']=106, ['#87AF5F']=107, ['#87AF87']=108, ['#87AFAF']=109, ['#87AFD7']=110, ['#87AFFF']=111,
  ['#87D700']=112, ['#87D75F']=113, ['#87D787']=114, ['#87D7AF']=115, ['#87D7D7']=116, ['#87D7FF']=117,
  ['#87FF00']=118, ['#87FF5F']=119, ['#87FF87']=120, ['#87FFAF']=121, ['#87FFD7']=122, ['#87FFFF']=123,
  ['#D70000']=160, ['#D7005F']=161, ['#D70087']=162, ['#D700AF']=163, ['#D700D7']=164, ['#D700FF']=165,
  ['#AF5F00']=130, ['#AF5F5F']=131, ['#AF5F87']=132, ['#AF5FAF']=133, ['#AF5FD7']=134, ['#AF5FFF']=135,
  ['#AF8700']=136, ['#AF875F']=137, ['#AF8787']=138, ['#AF87AF']=139, ['#AF87D7']=140, ['#AF87FF']=141,
  ['#AFAF00']=142, ['#AFAF5F']=143, ['#AFAF87']=144, ['#AFAFAF']=145, ['#AFAFD7']=146, ['#AFAFFF']=147,
  ['#AFD700']=148, ['#AFD75F']=149, ['#AFD787']=150, ['#AFD7AF']=151, ['#AFD7D7']=152, ['#AFD7FF']=153,
  ['#AFFF00']=154, ['#AFFF5F']=155, ['#AFFF87']=156, ['#AFFFAF']=157, ['#AFFFD7']=158, ['#AFFFFF']=159,
  ['#D75F00']=166, ['#D75F5F']=167, ['#D75F87']=168, ['#D75FAF']=169, ['#D75FD7']=170, ['#D75FFF']=171,
  ['#D78700']=172, ['#D7875F']=173, ['#D78787']=174, ['#D787AF']=175, ['#D787D7']=176, ['#D787FF']=177,
  ['#DFAF00']=178, ['#DFAF5F']=179, ['#DFAF87']=180, ['#DFAFAF']=181, ['#DFAFDF']=182, ['#DFAFFF']=183,
  ['#DFDF00']=184, ['#DFDF5F']=185, ['#DFDF87']=186, ['#DFDFAF']=187, ['#DFDFDF']=188, ['#DFDFFF']=189,
  ['#DFFF00']=190, ['#DFFF5F']=191, ['#DFFF87']=192, ['#DFFFAF']=193, ['#DFFFDF']=194, ['#DFFFFF']=195,
  ['#FF0000']=196, ['#FF005F']=197, ['#FF0087']=198, ['#FF00AF']=199, ['#FF00DF']=200, ['#FF00FF']=201,
  ['#FF5F00']=202, ['#FF5F5F']=203, ['#FF5F87']=204, ['#FF5FAF']=205, ['#FF5FDF']=206, ['#FF5FFF']=207,
  ['#FF8700']=208, ['#FF875F']=209, ['#FF8787']=210, ['#FF87AF']=211, ['#FF87DF']=212, ['#FF87FF']=213,
  ['#FFAF00']=214, ['#FFAF5F']=215, ['#FFAF87']=216, ['#FFAFAF']=217, ['#FFAFDF']=218, ['#FFAFFF']=219,
  ['#FFDF00']=220, ['#FFDF5F']=221, ['#FFDF87']=222, ['#FFDFAF']=223, ['#FFDFDF']=224, ['#FFDFFF']=225,
  ['#FFFF00']=226, ['#FFFF5F']=227, ['#FFFF87']=228, ['#FFFFAF']=229, ['#FFFFDF']=230, ['#FFFFFF']=231,
  ['#080808']=232, ['#121212']=233, ['#1C1C1C']=234, ['#262626']=235, ['#303030']=236, ['#3A3A3A']=237,
  ['#444444']=238, ['#4E4E4E']=239, ['#585858']=240, ['#626262']=241, ['#6C6C6C']=242, ['#767676']=243,
  ['#808080']=244, ['#8A8A8A']=245, ['#949494']=246, ['#9E9E9E']=247, ['#A8A8A8']=248, ['#B2B2B2']=249,
  ['#BCBCBC']=250, ['#C6C6C6']=251, ['#D0D0D0']=252, ['#DADADA']=253, ['#E4E4E4']=254, ['#EEEEEE']=255,
  ['NOCOLOR']='NONE',
}

local set_color_scheme = function()
  vim.api.nvim_set_hl(0, 'String'             , { ctermfg=cmap['#AFD7AF'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Comment'            , { ctermfg=cmap['#87AFD7'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Constant'           , { ctermfg=cmap['#AFD7AF'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Special'            , { ctermfg=cmap['#875F00'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Identifier'         , { ctermfg=cmap['#FFFFFF'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Statement'          , { ctermfg=cmap['#FFFF87'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'PreProc'            , { ctermfg=cmap['#FF87FF'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'type'               , { ctermfg=cmap['#D78787'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Underlined'         , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['NOCOLOR'], cterm={underline=true} } )
  vim.api.nvim_set_hl(0, 'Ignore'             , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Normal'             , { ctermfg=cmap['#FFFFFF'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'NonText'            , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'ErrorMsg'           , { ctermfg=cmap['#FFFFFF'], ctermbg=cmap['#0000FF'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Visual'             , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#3A3A3A'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Todo'               , { ctermfg=cmap['#AF87AF'], ctermbg=cmap['NOCOLOR'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'Keyword'            , { ctermfg=cmap['#AF87AF'], ctermbg=cmap['NOCOLOR'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'Search'             , { ctermfg=cmap['#FFFFFF'], ctermbg=cmap['#000080'], cterm={underline=true} } )
  vim.api.nvim_set_hl(0, 'IncSearch'          , { ctermfg=cmap['#000080'], ctermbg=cmap['#767676'], cterm={underline=true} } )
  vim.api.nvim_set_hl(0, 'SpecialKey'         , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Directory'          , { ctermfg=cmap['#5F87D7'], ctermbg=cmap['NOCOLOR'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'Title'              , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#3A3A3A'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'WarningMsg'         , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#000080'], cterm={} } )
  vim.api.nvim_set_hl(0, 'WildMenu'           , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#000080'], cterm={} } )
  vim.api.nvim_set_hl(0, 'ModeMsg'            , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#767676'], cterm={} } )
  vim.api.nvim_set_hl(0, 'MoreMsg'            , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#767676'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Question'           , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#767676'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Folded'             , { ctermfg=cmap['#3A3A3A'], ctermbg=cmap['NOCOLOR'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'FoldColumn'         , { ctermfg=cmap['#3A3A3A'], ctermbg=cmap['NOCOLOR'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'LineNr'             , { ctermfg=cmap['#D787AF'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'CursorLineNr'       , { ctermfg=cmap['#87FF87'], ctermbg=cmap['#1C1C1C'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'CursorLine'         , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#1C1C1C'], cterm={} } )
  vim.api.nvim_set_hl(0, 'DiffAdd'            , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#000080'], cterm={} } )
  vim.api.nvim_set_hl(0, 'DiffChange'         , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#FF87FF'], cterm={} } )
  vim.api.nvim_set_hl(0, 'DiffDelete'         , { ctermfg=cmap['#0000FF'], ctermbg=cmap['#00FFFF'], cterm={} } )
  vim.api.nvim_set_hl(0, 'DiffText'           , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#D70000'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'Cursor'             , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#FFFF87'], cterm={} } )
  vim.api.nvim_set_hl(0, 'lCursor'            , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#FFFFFF'], cterm={} } )
  vim.api.nvim_set_hl(0, 'StatusLine'         , { ctermfg=cmap['#87FF00'], ctermbg=cmap['NOCOLOR'], cterm={underline=true} } )
  vim.api.nvim_set_hl(0, 'StatusLineNC'       , { ctermfg=cmap['#FFFFFF'], ctermbg=cmap['NOCOLOR'], cterm={underline=true} } )
  vim.api.nvim_set_hl(0, 'VertSplit'          , { ctermfg=cmap['#008000'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'Pmenu'              , { ctermfg=cmap['#FFFFFF'], ctermbg=cmap['#1C1C1C'], cterm={} } )
  vim.api.nvim_set_hl(0, 'PmenuSel'           , { ctermfg=cmap['#008000'], ctermbg=cmap['#585858'], cterm={} } )
  vim.api.nvim_set_hl(0, 'PmenuSbar'          , { ctermfg=cmap['#5F87AF'], ctermbg=cmap['NOCOLOR'], cterm={underline=true} } )
  vim.api.nvim_set_hl(0, 'PmenuThumb'         , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['NOCOLOR'], cterm={} } )
  vim.api.nvim_set_hl(0, 'NvimTreeRootFolder' , { ctermfg=cmap['#AFAF00'], ctermbg=cmap['NOCOLOR'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'NvimTreeCursorline' , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#303030'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'NvimTreeOpenedFile' , { ctermfg=cmap['#AFD787'], ctermbg=cmap['NOCOLOR'], cterm={bold=true} } )
  vim.api.nvim_set_hl(0, 'TermCursor'         , { ctermfg=cmap['NOCOLOR'], ctermbg=cmap['#D70000'], cterm={} } )
  vim.api.nvim_set_hl(0, 'TermCursorNC'       , { ctermfg=cmap['#D70000'], ctermbg=cmap['NOCOLOR'], cterm={} } )
end

set_color_scheme()

--vim.api.nvim_create_autocmd('BufNew', { pattern='*', callback=set_color_scheme } )
