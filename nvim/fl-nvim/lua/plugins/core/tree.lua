-- plugin("snacks.nvim")
--     :opts({
--       explorer = {
--         enable = true,
--         replace_netrw = true,
--       },
--       picker = {
--         enable = true,
--         sources = {
--           explorer = {},
--         },
--       },
--     })
--     :keys(kmap("n", "<leader>e", function() require("snacks").explorer() end, "Toogle Explorer"))

plugin("nui.nvim"):config(false)
plugin("plenary.nvim"):config(false)
plugin("nvim-web-devicons"):config(false)
plugin("snacks.nvim"):config(false)
-- plugin("image.nvim"):config(false)
plugin("nvim-lsp-file-operations"):config(false)

plugin("neo-tree.nvim")
  :on_require("neo-tree")
  :cmd("Neotree")
  :keys(kmap("n", "<leader>e", kcmd "Neotree toggle", "Toogle Explorer"))
