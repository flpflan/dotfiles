
--require('mason-lspconfig').setup({
--    ensure_installed = { 'rust_analyzer' },
--})

local lspconfig = require("lspconfig")

local opts = {}

lspconfig["rust-analyzer"].setup(opts)
