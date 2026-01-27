plugin("nvim-toggler"):event_defer():opts {
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
		kmap("n", "gj", kcmd("TSJToggle"), "Join/Split Node"),
	})
	:opts({
		use_default_keymaps = false,
	})
