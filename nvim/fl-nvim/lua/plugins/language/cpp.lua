if not nixCats "language.cpp" then return end
---------------
----- LSP -----
---------------
lsp "clangd"
lsp "neocmakelsp"
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
