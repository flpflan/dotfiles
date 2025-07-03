require("lze").load {
  "blink.cmp",
  after = function()
    require("blink.cmp").setup({
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          -- optionally inherit from the `default` sources
          lua = { inherit_defaults = true, 'lazydev' }
        },
        providers = {
          -- dont show LuaLS require statements when lazydev has items
          -- lsp = { fallbacks = { "lazydev" } },
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    })
  end
}
