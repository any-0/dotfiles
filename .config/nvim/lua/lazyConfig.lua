vim.g.mapleader = " "

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- lazy plugins
require("lazy").setup({
    require("plugins.tree"),
    { "nvim-treesitter/nvim-treesitter" },
    { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup({'*'}, {RRGGBBAA = true, names = false, css_fn = true}) end, },
})

-- persistent undo
vim.opt.undofile   = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 1000
local undo_root = vim.fn.stdpath('state') .. '/undo'
vim.opt.undodir = undo_root .. '//'

-- plugins
require("plugins.lsp")
require("plugins.treesitter")
