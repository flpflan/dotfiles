-- Define colorscheme to use
local colorscheme = "catppuccin"

----------------------
----- UI/UX Keys -----
----------------------
kgroup(
  "<leader>u",
  "UI/UX",
  {},
  { kmap("n", "t", function() require("snacks").picker.colorschemes() end, "Change Colorscheme") }
)

------------------
----- Config -----
------------------
require("catppuccin").setup {
  transparent_background = true,
  integrations = {
    aerial = true,
    alpha = true,
    cmp = true,
    dap = true,
    dap_ui = true,
    gitsigns = true,
    illuminate = true,
    indent_blankline = true,
    markdown = true,
    mason = true,
    native_lsp = { enabled = true },
    neotree = true,
    notify = true,
    semantic_tokens = true,
    symbols_outline = true,
    telescope = true,
    treesitter = true,
    ts_rainbow = true,
    ufo = true,
    which_key = true,
    window_picker = true,
    colorful_winsep = { enabled = true, color = "lavender" },
    lsp_trouble = true,
  },
}

plugin("sweeties.nvim"):on_require("sweeties"):config(function() vim.g.sweetie = {} end)

-----------------
----- Setup -----
-----------------
-- Ensure colorscheme exists
local avail = vim.fn.getcompletion("", "color")
if not vim.tbl_contains(avail, colorscheme) then
  vim.notify('colorscheme "' .. colorscheme .. '" not found!')
  return
end

vim.cmd.colorscheme(colorscheme)
