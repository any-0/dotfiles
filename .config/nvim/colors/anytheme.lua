vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "anytheme"

local p = {
  bg   = "#0C1009",
  fg   = "#aaaaaa",
  red  = "#f7768e",
  greenA = "#9ABD6A",
  greenB = "#81BD77",
  greenC = "#9ece6a",
  yellowish = "#BBBD7A",
  blue = "#7aa2f7",
  cyan = "#7dcfff",
  mag  = "#bb9af7",
  yel  = "#e0af68",
  gray = "#565f89",
  lightGray = "#bbbbbb",
}

vim.api.nvim_set_hl(0, "Normal", { fg = "#000000", bg = "#ffffff" })
vim.api.nvim_set_hl(0, "Comment",  { fg = p.gray, italic = true })
vim.api.nvim_set_hl(0, "Constant", { fg = p.yel })
vim.api.nvim_set_hl(0, "String",   { fg = p.lightGray })
vim.api.nvim_set_hl(0, "Function", { fg = p.greenA, bold = true })
vim.api.nvim_set_hl(0, "Identifier",{ fg = p.yellowish })
vim.api.nvim_set_hl(0, "Statement",{ fg = p.greenB })
vim.api.nvim_set_hl(0, "Type",     { fg = p.yellowish })
vim.api.nvim_set_hl(0, "PreProc",  { fg = p.yel })
vim.api.nvim_set_hl(0, "Special",  { fg = p.yellowish })



vim.api.nvim_set_hl(0, "Normal", { fg = p.fg, bg = p.bg })

vim.api.nvim_set_hl(0, "@variable",   { fg = p.fg, bg = p.bg })
vim.api.nvim_set_hl(0, "@function",   { fg = p.greenA })
vim.api.nvim_set_hl(0, "@method",     { fg = p.greenB })
vim.api.nvim_set_hl(0, "@property",   { fg = p.yel })
vim.api.nvim_set_hl(0, "@field",      { fg = p.yel })
vim.api.nvim_set_hl(0, "@parameter",  { fg = p.yellowish })
vim.api.nvim_set_hl(0, "@keyword",    { fg = p.yellowish })
vim.api.nvim_set_hl(0, "@string",     { fg = p.lightGray })
vim.api.nvim_set_hl(0, "@number",     { fg = p.yel })
vim.api.nvim_set_hl(0, "@comment",    { fg = p.gray, italic = true })
