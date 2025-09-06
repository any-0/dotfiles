vim.g.mapleader = " "

--  ┌────────────────┐
--  │   lazy setup   │
--  └────────────────┘

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


require("lazy").setup({
    require("plugins.tree"),
    { "nvim-treesitter/nvim-treesitter" },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({'*'}, {RRGGBBAA = true, css = true})
        end,
    },

    --  ┌───────────────┐
    --  │     theme     │
    --  └───────────────┘

    --{
    --    "sainnhe/gruvbox-material",
    --    lazy = false,
    --    priority = 1000,
    --    config = function()
    --        vim.g.gruvbox_material_background = "light"
    --        vim.g.gruvbox_material_transparent_background = 1
    --        vim.cmd.colorscheme("gruvbox-material")
    --    end,
    --},
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("carbonfox")
        end,
    },

    --  ┌──────────────────────┐
    --  │     transparency     │
    --  └──────────────────────┘

  --{
  --    "xiyaowong/transparent.nvim",
  --    lazy = false,
  --    opts = {
  --        extra_groups  = {
  --            "NvimTreeNormal", "NvimTreeWinSeparator",
  --            "LualineNormal", "LualineInsert", "LualineVisual",
  --            "LualineReplace", "LualineCommand", "LualineTerminal",
  --            "StatusLine", "StatusLineNC" 
  --        },
  --        exclude_groups = { "CursorLine" },
  --    },
  --},
})

--  ┌─────────────────────┐
--  │   persistent undo   │
--  └─────────────────────┘

vim.opt.undofile   = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 1000
local undo_root = vim.fn.stdpath('state') .. '/undo'
vim.opt.undodir = undo_root .. '//'


--  ┌────────────────────────────┐
--  │   transparent statusline   │
--  └────────────────────────────┘

--vim.api.nvim_set_hl(0, "StatusLine",   { bg = "none", fg = nil })
--vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = nil })

--  ┌─────────────┐
--  │   plugins   │
--  └─────────────┘

require("plugins.lsp")
require("plugins.treesitter")
