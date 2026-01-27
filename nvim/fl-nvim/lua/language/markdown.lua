if not nixCats "language.markdown" then return end

local ft = { "markdown", "codecompanion", "opencode", "opencode_output" }
---------------
----- LSP -----
---------------
lsp("marksman"):cmd("marksman", "server"):ft(unpack(ft))
-----------------
--- Formatter ---
-----------------
formatter(ft, "prettierd")
-----------------
---- Plugins ----
-----------------
plugin("render-markdown"):dep_on("nvim-treesitter"):ft(unpack(ft)):opts {
  completions = { blink = { enabled = true } },
  file_types = ft,
  code = {
    border = "thick",
  },
}
