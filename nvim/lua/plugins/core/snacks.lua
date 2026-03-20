local snacks = require "snacks"

snacks.setup {
  indent = {
    enabled = true,
    indent = { enabled = true, char = "▏" },
    scope = { enabled = true, char = "▏" },
    animate = { enabled = false },
  },
  image = {
    enabled = true,
  },
  inputs = {
    enabled = false,
  },
  -- scroll = {
  -- 	enabled = true,
  -- },
  picker = {
    enabled = false,
    ui_select = true,
    main = {
      file = false,
    },
    matcher = {
      frecency = true,
    },
  },
}
vim.ui.select = snacks.picker.select
