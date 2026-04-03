local keymap = vim.keymap
local opts = {
  noremap = true, -- non-recursive
  silent = true, -- do not show message
}

-- Paste without overwriting the default register
vim.keymap.set("x", "p", '"_dP', { noremap = true, silent = true })
vim.keymap.set("x", "P", '"_dp', { noremap = true, silent = true })
-- Remove one character without yanking
-- vim.keymap.set("n", "x", '"x')

-----------------
-- Insert mode --
-----------------
-- keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" }) -- INFO: This is done by plugin

-----------------
-- Normal mode --
-----------------
-- Visual Select
keymap.set("n", "<M-v>", "<C-v>")
-- Edit
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
-- vim.keymap.set("n", "<leader>W", ":noautocmd w<CR>", { desc = "Save No Autocmd" })
keymap.set("n", "<leader>q", "<cmd>confirm q<CR>", { desc = "Quit Window" })
keymap.set("n", "<leader>Q", "<cmd>confirm qall<CR>", { desc = "Exit" })
keymap.set("n", "<leader>c", "<cmd>confirm bd<CR>", { desc = "Close Buffer" })

-- Window navigation -- INFO: This is done by plugin
-- keymap.set('n', '<C-h>', '<C-w>h', opts)
-- keymap.set('n', '<C-j>', '<C-w>j', opts)
-- keymap.set('n', '<C-k>', '<C-w>k', opts)
-- keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize window -- INFO: This is done by plugin
-- keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
-- keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
-- keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
-- keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- UI
-- keymap.set("n", "<leader>ut", "<cmd><CR>", { desc = "Change colorscheme" })
keymap.set("n", "<leader>uw", "<Cmd>set wrap!<CR>", { desc = "Toggle Visual Wrap" })
keymap.set("n", "|", "<Cmd>vsplit<CR>", { desc = "Vertical Split" })
keymap.set("n", "\\", "<Cmd>split<CR>", { desc = "Horizontal Split" })

-- Misc
-- vim.keymap.set("n", "<leader><leader>[", "<cmd>bprev<CR>", { desc = 'Previous buffer' })
-- vim.keymap.set("n", "<leader><leader>]", "<cmd>bnext<CR>", { desc = 'Next buffer' })
-- vim.keymap.set("n", "<leader><leader>l", "<cmd>b#<CR>", { desc = 'Last buffer' })
-- vim.keymap.set("n", "<leader><leader>d", "<cmd>bdelete<CR>", { desc = 'delete buffer' })

-----------------
-- Visual mode --
-----------------
vim.keymap.set("v", "<", "<gv", { desc = "Move Line Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Move Line Right" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Up" })
