---------------
----- LSP -----
---------------
local lspconfig = require("lspconfig")

local opts = {}

lspconfig.nixd.setup(opts)
----------------
---- Linter ----
----------------
require("nvim-lint").setup({
    linters_by_ft = {
      nix = { "statix", "deadnix" }
    },
})
-----------------
--- Formatter ---
-----------------
require("conform").setup({
    formatters_by_ft = {
        nix = { "alejandra" }
    }
})
