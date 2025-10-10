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
vim.opt.ignorecase = true
vim.opt.smartcase = true

local is_wsl = vim.fn.has("wsl") == 1
if is_wsl then
  vim.cmd.colorscheme("work")
else
  vim.cmd.colorscheme("anyscheme")
end

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

-- files are opened at the last visited line
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local last_pos = vim.fn.line([['"]])
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})
