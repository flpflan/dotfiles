if not nixCats "language.html-css" then return end
---------------
----- LSP -----
---------------
lsp "biome"
lsp("stylelint"):ft("css", "scss", "sass", "less")
-----------------
--- Formatter ---
-----------------
-- formatter({ "css", "scss", "sass", "less" }, "prettierd")
