-- Define colorscheme to use
local colorscheme = "catppuccin"

----------------------
----- UI/UX Keys -----
----------------------
kgroup("<leader>u", "UI/UX", {}, {
  kmap("n", "t", function() require("snacks").picker.colorschemes() end, "Change Colorscheme"),
  kmap("n", "T", kcmd "TransparentToggle", "Toggle Transparency"),
})

------------------
----- Config -----
------------------
local transparent = require "transparent"
transparent.setup {
  exclude_groups = {
    "TelescopeSelection",
    "TelescopePreviewLine",
    "BlinkCmpMenuSelection",
    "BlinkCmpScrollBarGutter",
  },
  extra_groups = {
    "NormalFloat",
    "NvimTreeNormal",
  },
}
transparent.clear_prefix "BlinkCmp"
transparent.clear_prefix "Telescope"
transparent.clear_prefix "Trouble"
transparent.clear_prefix "DiffviewFilePanel"
transparent.clear_prefix "Notify"
transparent.clear_prefix "OilVcsStatus"
transparent.clear_prefix "WhichKey"
transparent.clear_prefix "Float"
transparent.clear_prefix "Flash"
transparent.clear_prefix "NormalFloat"
transparent.clear_prefix "LspInlayHint"

require("catppuccin").setup {
  transparent_background = true,
  auto_integrations = true,
  integrations = {
    colorful_winsep = { color = "lavender" },
    snacks = { indent_scope_color = "lavender" },
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
