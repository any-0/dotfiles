vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.o.termguicolors = true
vim.g.colors_name = "anyscheme"

local P = {
  Bg      = "#0D100C",
  Fg      = "#eaf7e5",
  Comment = "#75715E",
  Dim     = "#A7A7A3",
  Pink    = "#45e888",
  Orange  = "#84b865",
  Yellow  = "#e6db74",
  Green   = "#a6e295",
  Blue    = "#84bafa",
  Purple  = "#38a8c3",
  Visual  = "#25281F",
  CL      = "#1E1F1A",
  Split   = "#3A3A33",
  PMenu   = "#1C1D17",
  PSel    = "#323226",
}

local function HI(g, o) vim.api.nvim_set_hl(0, g, o) end

-- Core
HI("Normal",        { fg = P.Fg, bg = P.Bg })
HI("Comment",       { fg = P.Comment })
HI("LineNr",        { fg = "#839496", bg = "NONE" })
HI("CursorLine",    { bg = P.CL })
HI("CursorLineNr",  { fg = P.Yellow })
HI("CursorColumn",  { bg = P.CL })
HI("Visual",        { bg = P.Visual })
HI("Search",        { fg = P.Bg, bg = P.Yellow })
HI("IncSearch",     { fg = P.Bg, bg = P.Orange })
HI("MatchParen",    { fg = P.Pink, bold = true })
HI("VertSplit",     { fg = P.Split })
HI("StatusLine",    { fg = P.Fg, bg = "#23241E" })
HI("StatusLineNC",  { fg = P.Dim, bg = "#23241E" })
HI("Pmenu",         { fg = P.Fg, bg = P.PMenu })
HI("PmenuSel",      { fg = P.Fg, bg = P.PSel, bold = true })
HI("PmenuThumb",    { bg = "#4A4A40" })

-- Syntax (Vim)
HI("Constant",      { fg = P.Purple })
HI("String",        { fg = P.Yellow })
HI("Character",     { fg = P.Yellow })
HI("Number",        { fg = P.Purple })
HI("Boolean",       { fg = P.Purple })
HI("Float",         { fg = P.Purple })

HI("Identifier",    { fg = P.Fg })
HI("Function",      { fg = P.Green, bold = true })

HI("Statement",     { fg = P.Pink, bold = true })
HI("Conditional",   { fg = P.Pink, bold = true })
HI("Repeat",        { fg = P.Pink, bold = true })
HI("Label",         { fg = P.Pink })
HI("Operator",      { fg = P.Fg })
HI("Keyword",       { fg = P.Pink, bold = true })
HI("Exception",     { fg = P.Pink })

HI("PreProc",       { fg = P.Orange })
HI("Include",       { fg = P.Orange })
HI("Define",        { fg = P.Orange })
HI("Macro",         { fg = P.Orange })

HI("Type",          { fg = P.Blue })
HI("StorageClass",  { fg = P.Blue })
HI("Structure",     { fg = P.Blue })
HI("Typedef",       { fg = P.Blue })

HI("Special",       { fg = P.Orange })
HI("SpecialComment",{ fg = P.Dim, italic = true })
HI("Todo",          { fg = P.Bg, bg = P.Blue, bold = true })
HI("Error",         { fg = P.Bg, bg = P.Pink, bold = true })

-- Treesitter (links keep it lean)
HI("@comment",      { link = "Comment" })
HI("@string",       { link = "String" })
HI("@character",    { link = "Character" })
HI("@number",       { link = "Number" })
HI("@float",        { link = "Float" })
HI("@boolean",      { link = "Boolean" })
HI("@constant",     { link = "Constant" })
HI("@constant.builtin", { link = "Constant" })
HI("@variable",     { fg = P.Fg })
HI("@field",        { fg = P.Fg })
HI("@parameter",    { fg = P.Fg })
HI("@function",     { link = "Function" })
HI("@function.builtin", { link = "Function" })
HI("@method",       { link = "Function" })
HI("@keyword",      { link = "Keyword" })
HI("@conditional",  { link = "Conditional" })
HI("@repeat",       { link = "Repeat" })
HI("@operator",     { link = "Operator" })
HI("@type",         { link = "Type" })
HI("@attribute",    { fg = P.Orange })
HI("@decorator",    { fg = P.Orange })
HI("@string.documentation.python", { link = "Comment" })
HI("@string.multiline.python",     { link = "Comment" })
