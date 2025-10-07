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
            "html", "css", "latex"
          },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    },
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.pick").setup()
      vim.g.mapleader = " "
      local map = vim.keymap.set
      map("n", "<leader>f", "<Cmd>Pick files<CR>")
      map("n", "<leader>g", "<Cmd>Pick grep_live<CR>")
      map("n", "<leader>r", "<Cmd>Pick buffers<CR>")
      map("n", "<leader>h", "<Cmd>Pick help<CR>")
    end,
  },
}, { lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json", })
