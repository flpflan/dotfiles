local opts = {
  dashboard = {}
}

require("lze").load {
  "snacks.nvim",
  lazy = false,
  priority = 1000,
  after = function()
    require("snacks").setup(opts)
  end
}
