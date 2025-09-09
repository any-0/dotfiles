vim.api.nvim_set_hl(0, "TodoHighlight", { fg = "#000000", bg = "#FFFF00", bold = true })



vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.fn.matchadd("TodoHighlight", [[\v<TODO>]])
  end,
})
