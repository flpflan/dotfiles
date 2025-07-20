---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "somesass_ls" })
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        somesass_ls = {
          filetypes = { "scss", "sass", "vue" },
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "some-sass-language-server" })
    end,
  },
}
