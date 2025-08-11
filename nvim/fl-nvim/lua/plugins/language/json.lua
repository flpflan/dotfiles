if not nixCats "language.json" then return end
---------------
----- LSP -----
---------------
lsp("jsonls"):settings {
  json = {
    schemas = require("schemastore").json.schemas(),
    validate = { enable = true },
  },
}
-----------------
--- Formatter ---
-----------------
formatter("json", "prettierd")
