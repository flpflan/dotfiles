if not nixCats "language.cpp" then return end
---------------
----- LSP -----
---------------
-- TODO: lsp("clice"):cmd("clice", "--resource-dir", "/home/flpflan/Downloads/clice/lib/clang/20/include"):ft("cpp", "c")
lsp "clangd"
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
