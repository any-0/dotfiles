local keymap = vim.keymap.set
vim.keymap.set({ "n", "v", "x", "o" }, "<Space>", "<Nop>", { silent = true })
keymap({ "n", "v", "o", "i" }, "<F1>", "<Nop>", { noremap = true, silent = true, desc = "Unbind F1" })
vim.g.mapleader = " "

--  ┌────────────────┐
--  │   base binds   │
--  └────────────────┘

keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })
keymap("n", "gl", vim.diagnostic.open_float, { noremap = true, silent = true })
keymap("n", "U", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
keymap({ "n", "v", "o" }, "§", "^", { noremap = true, silent = true, desc = "Jump to first non-blank (alias for ^)"})
keymap({ "n", "v", "o" }, "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Ctrl+d jumps down and centers the cursor" })
keymap({ "n", "v", "o" }, "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Ctrl+u jumps down and centers the cursor" })
keymap({ "n", "v", "o" }, "ß", "\"+", { noremap = true, silent = true, desc = "Select clipboard register" })

--  ┌──────────────────────┐
--  │   heading function   │
--  └──────────────────────┘

keymap({ "n" }, "°", function()
  vim.cmd([[normal! yypkpkVr─^i┌──$a────┐jjVr─^i└──$a────┘k^i│   $a   │]])
  local ch = vim.fn.nr2char(vim.fn.getchar())
  if ch == "/" then
    vim.cmd([[normal! ^i//  k^i//  jj^i//  ^j]])
  elseif ch == "#" then
    vim.cmd([[normal! ^i#  k^i#  jj^i#  ^j]])
  elseif ch == "%" then
    vim.cmd([[normal! ^i%  k^i%  jj^i%  ^j]])
  elseif ch == "-" then
    vim.cmd([[normal! ^i--  k^i--  jj^i--  ^j]])
  end
end, { noremap = true, silent = true, desc = "Custom heading" })

--  ┌────────────────────────────────┐
--  │   tree movement with ä, ö, ü   │
--  └────────────────────────────────┘

local function tree_move_and_open(direction)
    local api = require("nvim-tree.api")
    local cnt = vim.v.count
    if cnt == 0 then cnt = 1 end
    api.tree.open()
    vim.cmd("NvimTreeFocus")
    local move_cmd = tostring(cnt) .. (direction == "up" and "k" or "j")
    vim.cmd("silent! normal! " .. move_cmd)
    local node = api.tree.get_node_under_cursor()
    api.node.open.edit(node)
    vim.cmd("wincmd l")
end

vim.keymap.set("n", "ä", function() tree_move_and_open("up") end,
    { silent = true, desc = "NvimTree: move up N entries and open" })
vim.keymap.set("n", "ö", function() tree_move_and_open("down") end,
    { silent = true, desc = "NvimTree: move down N entries and open" })


--  ┌───────────────────────────────┐
--  │   toggle colorscheme binding  │
--  └───────────────────────────────┘

local theme_file = vim.fn.stdpath("state") .. "/last_theme.txt"
local themes = { "anytheme", "notheme" }

local function read_last_theme()
  local f = io.open(theme_file, "r")
  if f then
    local theme = f:read("*l")
    f:close()
    return theme
  end
  return themes[1]
end

local function write_last_theme(theme)
  local f = io.open(theme_file, "w")
  if f then
    f:write(theme)
    f:close()
  end
end

local function apply_theme(theme)
  vim.cmd.colorscheme(theme)
  write_last_theme(theme)
end

local function toggle_theme()
  local current = read_last_theme()
  local next_theme = (current == themes[1]) and themes[2] or themes[1]
  apply_theme(next_theme)
end

vim.keymap.set("n", "<C-t>", toggle_theme, { noremap = true, silent = true, desc = "Toggle colorscheme" })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    apply_theme(read_last_theme())
  end,
})
