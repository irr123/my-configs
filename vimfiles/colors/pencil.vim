" Copypasted and modified https://github.com/reedes/vim-colors-pencil

highlight clear

if exists("syntax on")
    syntax reset
endif

set background=light
let g:colors_name="pencil"

let s:black  = {"gui": "#4d4d4b", "cterm": "0" }
let s:red    = {"gui": "#b50000", "cterm": "1" }
let s:green  = {"gui": "#5f8700", "cterm": "2" }
let s:yellow = {"gui": "#d75f00", "cterm": "3" }
let s:blue   = {"gui": "#007aff", "cterm": "4" }
let s:purple = {"gui": "#8700af", "cterm": "5" }
let s:cyan   = {"gui": "#008b8b", "cterm": "6" }
let s:white  = {"gui": "#dddddd", "cterm": "7" }
let s:gray   = {"gui": "#808080", "cterm": "8" }
let s:pink   = {"gui": "#ff00ff", "cterm": "13"}

let s:sp_un  = "undercurl"

function! s:h(group, style)
  " Not all terminals support italics properly
  if has_key(a:style, "cterm") && a:style["cterm"] == "italic"
    unlet a:style.cterm
  endif
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" (see `:h w18`)
call s:h("Comment",          {"fg": s:gray})
call s:h("FoldColumn",       {"fg": s:gray})
call s:h("Folded",           {"fg": s:gray})
call s:h("LineNr",           {"fg": s:gray})
call s:h("NonText",          {"fg": s:gray})
call s:h("SignColumn",       {"fg": s:gray})
call s:h("SpecialKey",       {"fg": s:gray})
call s:h("MatchParen",       {"fg": s:yellow})
call s:h("VertSplit",        {"fg": s:gray,  "bg": s:gray})
call s:h("CursorLineNr",     {"fg": s:white, "bg": s:gray})
call s:h("StatusLineNC",     {"fg": s:white, "bg": s:gray})
call s:h("StatusLineTermNC", {"fg": s:white, "bg": s:gray})
call s:h("ToolbarButton",    {"fg": s:white, "bg": s:gray})
call s:h("Visual",           {"fg": s:white, "bg": s:gray})
call s:h("VisualNOS",        {"fg": s:white, "bg": s:gray})
call s:h("IncSearch",        {"fg": s:white, "bg": s:black})
call s:h("Search",           {"fg": s:white, "bg": s:black})
call s:h("StatusLine",       {"fg": s:white, "bg": s:black})
call s:h("StatusLineTerm",   {"fg": s:white, "bg": s:black})

call s:h("DiffAdd",          {"fg": s:white, "bg": s:green })
call s:h("DiffAdded",        {"fg": s:white, "bg": s:green })
call s:h("DiffChange",       {"fg": s:white, "bg": s:yellow})
call s:h("DiffChanged",      {"fg": s:white, "bg": s:yellow})
call s:h("DiffDelete",       {"fg": s:white, "bg": s:red   })
call s:h("DiffRemoved",      {"fg": s:white, "bg": s:red   })
call s:h("DiffText",         {"fg": s:white, "bg": s:blue  })

call s:h("ColorColumn",      {"fg": s:white, "bg": s:gray })
call s:h("Pmenu",            {"fg": s:white, "bg": s:black})
call s:h("PmenuSbar",        {               "bg": s:black})
call s:h("PmenuSel",         {"fg": s:white, "bg": s:pink })
call s:h("PmenuThumb",       {               "bg": s:gray })
call s:h("TabLine",          {"fg": s:black,              })
call s:h("TabLineFill",      {                            })
call s:h("TabLineSel",       {"fg": s:white, "bg": s:black})

call s:h("Cursor",           {"fg": s:white, "bg": s:pink})
call s:h("CursorColumn",     {"fg": s:white, "bg": s:pink})
call s:h("CursorIM",         {"fg": s:white, "bg": s:pink})
call s:h("CursorLine",       {"fg": s:white, "bg": s:pink})
call s:h("TermCursor",       {"fg": s:white, "bg": s:pink})
call s:h("WildMenu",         {"fg": s:white, "bg": s:pink})

call s:h("Normal",           {"fg": s:black,             })
call s:h("Boolean",          {})
call s:h("Conceal",          {})
call s:h("Conditional",      {})
call s:h("Constant",         {})
call s:h("Debug",            {})
call s:h("Define",           {})
call s:h("Delimiter",        {})
call s:h("Directory",        {})
call s:h("Exception",        {})
call s:h("Function",         {})
call s:h("Identifier",       {})
call s:h("Include",          {})
call s:h("Keyword",          {})
call s:h("Label",            {})
call s:h("Macro",            {})
call s:h("ModeMsg",          {})
call s:h("MoreMsg",          {})
call s:h("Operator",         {})
call s:h("PreCondit",        {})
call s:h("PreProc",          {})
call s:h("Question",         {})
call s:h("Repeat",           {})
call s:h("Special",          {})
call s:h("SpecialChar",      {})
call s:h("SpecialComment",   {})
call s:h("Statement",        {})
call s:h("StorageClass",     {})
call s:h("Structure",        {})
call s:h("Type",             {})
call s:h("Typedef",          {})

call s:h("Character",        {"fg": s:green })
call s:h("String",           {"fg": s:green })
call s:h("Float",            {"fg": s:blue  })
call s:h("Number",           {"fg": s:blue  })
call s:h("Title",            {"fg": s:red   })
call s:h("ErrorMsg",         {"fg": s:red   })
call s:h("WarningMsg",       {"fg": s:yellow})

call s:h("Tag",              {"fg": s:cyan                            })
call s:h("Ignore",           {"fg": s:white                           })
call s:h("Error",            {"fg": s:white, "bg": s:red,             })
call s:h("Todo",             {"fg": s:white, "bg": s:cyan,            })
call s:h("Underlined",       {"cterm": "underline", "gui": "underline"})

call s:h("SpellBad",         {"gui": s:sp_un, "sp": s:red,    "cterm": s:sp_un, "fg": s:red   })
call s:h("SpellCap",         {"gui": s:sp_un, "sp": s:cyan,   "cterm": s:sp_un, "fg": s:cyan  })
call s:h("SpellLocal",       {"gui": s:sp_un, "sp": s:gray,   "cterm": s:sp_un, "fg": s:black })
call s:h("SpellRare",        {"gui": s:sp_un, "sp": s:purple, "cterm": s:sp_un, "fg": s:purple})

call s:h("htmlBold",         {"fg": s:yellow})
call s:h("htmlItalic",       {"fg": s:cyan  })
call s:h("markdownCode",     {"fg": s:green })

highlight link lscDiagnosticError SpellBad
highlight link lscDiagnosticWarning SpellRare
highlight link lscDiagnosticInfo SpellLocal
highlight link lscDiagnosticHint SpellCap

highlight link LspErrorHighlight SpellBad
highlight link LspWarningHighlight SpellRare
highlight link LspInformationHighlight SpellLocal
highlight link LspHintHighlight SpellCap

highlight link ALEError SpellBad
highlight link ALEStyleError SpellBad
highlight link ALEErrorLine SpellBad
highlight link ALEWarning SpellRare
highlight link ALEStyleWarning SpellRare
highlight link ALEWarningLine SpellRare
highlight link ALEInfoLine SpellLocal
