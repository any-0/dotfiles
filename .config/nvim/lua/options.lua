vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.fillchars:append { eob = " " }
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"

vim.cmd.colorscheme("anyscheme")

-- persistent undo
vim.opt.undofile   = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 1000
local undo_root = vim.fn.stdpath('state') .. '/undo'
vim.opt.undodir = undo_root .. '//'

-- cursorline and cursorcolumn; both hidden in visual mode
vim.opt.cursorcolumn = true
vim.opt.cursorline = true

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    local m = vim.v.event.new_mode
    if m:find("^v") or m:find("^V") or m:find("\22") then
      vim.opt_local.cursorcolumn = false
    else
      vim.opt_local.cursorcolumn = true
    end
  end,
})
