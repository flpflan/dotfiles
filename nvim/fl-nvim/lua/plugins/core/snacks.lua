plugin("snacks.nvim")
  :lazy(false)
  :on_require("snacks")
  :setup(function() vim.ui.select = require("snacks.picker").select end)
  :opts {
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
