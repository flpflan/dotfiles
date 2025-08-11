if not nixCats "language.rust" then return end
---------------
----- LSP -----
---------------
lsp "rust_analyzer"
----------------
---- Linter ----
----------------
linter("rust", "clippy")
-----------------
--- Formatter ---
-----------------
formatter("rust", "rustfmt")
-----------------
--- Debugger ---
-----------------
dap("rust", {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
  enrich_config = require "internal.dap.enrich_config.cargo",
})
