vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "anyscheme"

local p = {
  bg = "#0D100C",
  fg = "#dddddd",
  greenA = "#9ABD6A",
  yellowish = "#00BD7A",
  yel  = "#00af68",
  gray = "#565f89",
  lightGray = "#bbbbbb",
}

vim.api.nvim_set_hl(0, "Comment", { fg = p.gray, italic = true })
vim.api.nvim_set_hl(0, "Constant", { fg = p.yel })
vim.api.nvim_set_hl(0, "String", { fg = p.lightGray })
vim.api.nvim_set_hl(0, "Function", { fg = p.greenA, bold = true })
vim.api.nvim_set_hl(0, "Identifier", { fg = p.yellowish })
vim.api.nvim_set_hl(0, "Statement", { fg = p.greenB })
vim.api.nvim_set_hl(0, "Visual", { bg = "#444444", fg = "NONE" })

vim.api.nvim_set_hl(0, "Normal", { fg = p.fg, bg = p.bg })
vim.api.nvim_set_hl(0, "LineNr", { fg = p.greenA, bg = "NONE" })



vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#222222" })
