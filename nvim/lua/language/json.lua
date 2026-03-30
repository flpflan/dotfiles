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
plugin("keytrail")
  :ft("yaml", "json", "jsonc", "json5")
  -- :keys(kgroup("<leader>f", "Find", {}, {
  --   --TODO: yik for KeyTrailYank for yaml/json buffers
  --   kmap("n", "k", kcmd "KeyTrailJump", "Key"),
  -- }))
  :opts {
    key_mapping = "fk",
    filetypes = { yaml = true, json = true, jsonc = true, json5 = true },
    popup = { enabled = false },
  }
