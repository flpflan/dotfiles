-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- vim.g.aurora_transparent = 1
-- vim.cmd.colorscheme "aurora"
-- require("catppuccin").setup { transparent_background = true }
-- vim.cmd.colorscheme "catppuccin"

require("markview").setup {
  opts = function(_, opts) opts.mappings.n["<c-m>"] = { "<Cmd>Markview splitToggle<CR>", desc = "Toggle markview" } end,
}
vim.cmd [[
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr
set fileencoding=utf-8
]]
