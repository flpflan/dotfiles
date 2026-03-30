plugin("luasnip")
  :event_defer()
  :opts({
    history = true,
    updateevents = "TextChangedI, TextChangedI", -- BUG: nvim-cmp breaks with this setting
  })
  :setup(function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load { paths = { joinpath(LUA_PATH, "snippets") } }
  end)
