if not nixCats "language.cpp" then return end
---------------
----- LSP -----
---------------
-- lsp("clice")
lsp("clangd"):cmd("clangd", "--clang-tidy")
lsp "neocmake"
-----------------
--- Formatter ---
-----------------
formatter({ "c", "cpp" }, "clangd-format")
-- formatter("cmake", "gersemi")
-----------------
---- Plugins ----
-----------------
-- require("clangd_extensions").setup() -- Lazyloaded by itself
-- require("cmake-tools").setup() -- Lazyloaded by itself
