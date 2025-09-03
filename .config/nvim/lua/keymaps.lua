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
