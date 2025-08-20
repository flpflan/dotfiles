if not nixCats "language.typescript" then return end
---------------
----- LSP -----
---------------
lsp("vtsls"):settings(require("vtsls").lspconfig)
lsp "biome"
----------------
---- Linter ----
----------------
-----------------
--- Formatter ---
-----------------
-----------------
--- Debugger ---
-----------------
-- dap("pwa-node", {
--   type = "server",
--   host = "localhost",
--   port = "${port}",
--   executable = {
--     command = vim.fn.exepath "js-debug-adapter",
--     args = { "${port}" },
--   },
-- })
-----------------
---- Plugins ----
-----------------
plugin("ts-error-translator.nvim"):event_defer()
plugin("package-info"):opts {
  package_manager = "bun",
}
