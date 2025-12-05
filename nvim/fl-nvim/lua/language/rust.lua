if not nixCats "language.rust" then return end
---------------
----- LSP -----
---------------
-- INFO: Automatically done by rustaceanvim
-- lsp("rust_analyzer"):settings {
--   ["rust-analyzer"] = {
--     files = {
--       excludeDirs = {
--         ".direnv",
--         ".git",
--         "target",
--       },
--     },
--     check = {
--       command = "clippy",
--       extraArgs = {
--         "--no-deps",
--       },
--     },
--   },
-- }
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
  type = "executable",
  command = "codelldb",
  enrich_config = require "internal.dap.enrich_config.cargo",
})
-----------------
---- Plugins ----
-----------------
plugin("crates.nvim"):event("BufRead Cargo.toml"):opts {
  completion = {
    crates = { enabled = true },
  },
  lsp = {
    enabled = true,
    actions = true,
    completion = true,
    hover = true,
  },
}
-- TODO: rustaceanvim
