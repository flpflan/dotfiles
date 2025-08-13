if require("nixCatsUtils").isNixCats then return end

local binary = {
  "tree-sitter",
}
local lsps = {
  "jsonls",
  "prettierd",
  "lua_ls",
  "selene",
  "stylua",
  "nixd",
  "statix",
  "deadnix",
  "alejandra",
  "rust_analyzer",
  "clippy",
  "rustfmt",
  "taplo",
}

-- TODO: package(...)
local plugins = {
  "BirdeeHub/lze",
  "BirdeeHub/lzextras",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/nvim-treesitter-context",
  "RRethy/nvim-treesitter-endwise",
  "Saghen/blink.cmp",
  "saghen/blink.compat",
  "b0o/schemastore.nvim",
  "folke/trouble.nvim",
  "numToStr/Comment.nvim",
  "stevearc/conform.nvim",
  "mfussenegger/nvim-lint",
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "stevearc/overseer.nvim",
  "folke/lazydev.nvim",
  "NTBBloodbath/daylight.nvim",
  "nvim-lualine/lualine.nvim",
  "folke/noice.nvim",
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
  "folke/snacks.nvim",
  "folke/which-key.nvim",
  "catppuccin/nvim",
  "NTBBloodbath/sweetie.nvim",
  "folke/neoconf.nvim",
  "nvim-neotest/neotest",
  "nvim-neotest/nvim-nio",
  "nvim-lua/plenary.nvim",
  "echasnovski/mini.icons",
  "saghen/blink.cmp",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "max397574/better-escape.nvim",
  "nvim-neo-tree/neo-tree.nvim",
  "nvim-tree/nvim-web-devicons",
  "antosha417/nvim-lsp-file-operations",
  "dmmulroy/ts-error-translator.nvim",
  "stevearc/oil.nvim",
  "SirZenith/oil-vcs-status",
  "goolord/alpha-nvim",
  "echasnovski/mini.pairs",
  "karb94/neoscroll.nvim",
  "mrjones2014/smart-splits.nvim",
}

if vim.version:ge "0.12" then
  -- TODO:
else
  require("nixCatsUtils.catPacker").setup(plugins)
end
