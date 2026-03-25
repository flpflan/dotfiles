if not nixCats "language.cpp" then return end
---------------
----- LSP -----
---------------
-- lsp("clice")
lsp("clangd"):cmd(
  "clangd",
  "--clang-tidy",
  -- "--clang-tidy-check=performance-*,bugprone-*",
  "--background-index",
  "-j=16",
  "--completion-style=bundled",
  "--all-scopes-completion",
  "--header-insertion=iwyu",
  "--header-insertion-decorators"
)
lsp "neocmake"
-----------------
--- Formatter ---
-----------------
formatter({ "c", "cpp" }, "clang-format")
-- formatter("cmake", "gersemi")
-----------------
---- Plugins ----
-----------------
plugin("clangd_extensions"):event_defer()
plugin("cmake-tools.nvim"):event_defer():dep_on("overseer", "toggleterm")
