plugin("nvim-toggler"):event_defer():opts {
  inverses = {
    ["Disable"] = "Enable",
    -- ["Disabled"] = "Enabled",
    -- ["disabled"] = "enabled",
  },
}
