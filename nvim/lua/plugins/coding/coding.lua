plugin("nvim-toggler")
  :event_defer()
  :keys({ kmap({ "n", "x" }, "<leader>i", klazy("nvim-toggler").toggle(), "Toggle Invert") })
  :opts {
    remove_default_keybinds = true,
    inverses = {
      ["Yes"] = "No",
      ["yes"] = "no",
      ["Disable"] = "Enable",
      ["Disabled"] = "Enabled",
      ["disabled"] = "enabled",
      ["ON"] = "OFF",
      ["on"] = "off",
    },
  }

plugin("treesj")
  :cmd({ "TSJSplit", "TSJJoin", "TSJToggle" })
  :keys({
    kmap("n", "gj", kcmd "TSJToggle", "Join/Split Node"),
  })
  :opts {
    use_default_keymaps = false,
  }

plugin("substitute.nvim"):event_defer():keys(kopts({ noremap = true }, {
  kmap("n", "<C-s>", klazy("substitute").operator(), "Substitute"),
  kmap("n", "<C-s><C-s>", klazy("substitute").line(), "Substitute Line"),
  kmap("n", "<C-S-s>", klazy("substitute").eol(), "Substitute EOL"),
  kmap("x", "<C-s>", klazy("substitute").visual(), "Substitute"),
}))
