local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "python", "cpp", "lua", "bash", "json",
            "yaml", "javascript", "typescript", "tsx",
            "html", "css"
          },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    }
}, { lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json", })
