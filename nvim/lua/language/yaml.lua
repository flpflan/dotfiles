if not nixCats "language.yaml" then return end
---------------
----- LSP -----
---------------
lsp("yamlls"):ft("yaml", "yaml.docker-compose", "yaml.gitlab"):settings {
  yaml = {
    schemaStore = {
      enable = false,
      url = "",
    },
    schemas = require("schemastore").yaml.schemas(),
  },
}
-----------------
--- Formatter ---
-----------------
formatter("yaml", "prettierd")
-----------------
---- Plugins ----
-----------------
plugin("yaml"):ft("yaml", "json", "helm"):on_require("yaml_nvim"):opts {
  ft = { "yaml", "helm" },
}

-- INFO: This is done by KeyTrailJump
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = { "*.yaml", "*.yml", "*.json", "*.helm" },
-- 	callback = function(args)
-- 		kopts({ buffer = args.buf }, {
-- 			kmap("n", "<leader>fk", kcmd("YAMLSnacks"), "Keys"),
-- 		})
-- 	end,
-- })

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
