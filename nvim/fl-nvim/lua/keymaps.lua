local keymap = vim.keymap
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

-----------------
-- Insert mode --
-----------------
-- keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" }) -- INFO: This is done by plugin

-----------------
-- Normal mode --
-----------------
-- Edit
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
keymap.set("n", "<leader>q", "<cmd>confirm q<CR>", { desc = "Quit Window" })
keymap.set("n", "<leader>Q", "<cmd>confirm qall<CR>", { desc = "Exit" })
keymap.set("n", "<leader>c", "<cmd>confirm bd<CR>", { desc = "Close Buffer" })

-- Window navigation
keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize window
keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- UI
-- keymap.set("n", "<leader>ut", "<cmd><CR>", { desc = "Change colorscheme" })

-----------------
-- Visual mode --
-----------------
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
