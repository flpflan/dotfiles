if not nixCats "language.bundles.frontend" then return end
---------------
----- LSP -----
---------------
lsp "biome"
-- Typescript
lsp("vtsls"):init_options(require("vtsls").lspconfig):settings {
  vtsls = {
    tsserver = {
      globalPlugins = {
        {
          name = "@vue/typescript-plugin",
          location = vim.fn.exepath "vue-language-server",
          languages = { "vue" },
          configNamespace = "typescript",
        },
      },
    },
  },
}
-- Css
lsp("stylelint"):ft("css", "scss", "sass", "less")
-- Vue
lsp "vue_ls"
----------------
---- Linter ----
----------------
-----------------
--- Formatter ---
-----------------
-- formatter({ "css", "scss", "sass", "less" }, "prettierd")
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
