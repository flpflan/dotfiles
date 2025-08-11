-- TODO: organise keymaps
-- vim.keymap.set("n", "<leader>", "<cmd>WhichKey ,<cr>", { desc = "Buffer Local Keymaps (which-key)" })

require("which-key").setup {
  layout = {
    align = "center",
    spacing = 5,
  },
}

-- local groups = {
--     { "<leader>b", group = "Buffers" },
--     { "<leader>g", group = "Git" },
--     { "<leader>l", group = "LSP" },
--     { "<leader>n", group = "Neorg" },
--     { "<leader>p", group = "Plugins" },
--     { "<leader>s", group = "Sessions" },
--     { "<leader>t", group = "Toggle" },
--     { "<leader>w", group = "Windows" },
-- }
--
-- local g_lsp = {
--     { "<leader>ld", group = "Diagnostics" },
--     { "<leader>lg", group = "Goto" },
-- }
--
-- local g_neorg = {
--     { "<leader>nm", group = "Metadata" },
--     { "<leader>no", group = "ToC" },
-- }
--
-- wk.add(groups)
-- wk.add(g_lsp)
-- wk.add(g_neorg)
