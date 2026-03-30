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

-----------------
---- Plugins ----
-----------------
plugin("keytrail"):ft("yaml", "json", "jsonc", "json5"):opts {
  key_mapping = "fk",
  --TODO: yik for KeyTrailYank for yaml/json buffers
  -- yank_key_mapping = "jy",
  filetypes = { yaml = true, json = true, jsonc = true, json5 = true },
  popup = { enabled = false },
}
