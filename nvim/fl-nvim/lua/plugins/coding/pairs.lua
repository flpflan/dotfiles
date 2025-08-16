-- plugin("mini.pairs"):event_defer():opts({
-- 	modes = { insert = true, command = true, terminal = false },
-- })

-- plugin("nvim-treesitter-endwise")

plugin("nvim-ts-autotag"):event({ "BufReadPre", "BufNewFile" }):opts {
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
  per_filetype = {
    ["html"] = {
      enable_close = false,
    },
  },
}

plugin("nvim-autopairs"):event_typing():opts {
  check_ts = true,
}

-- TODO:
plugin("tabout.nvim"):event_typing():on_require("tabout"):opts {
  act_as_shift_tab = true,
  tabouts = {
    { open = "'", close = "'" },
    { open = '"', close = '"' },
    { open = "`", close = "`" },
    { open = "(", close = ")" },
    { open = "[", close = "]" },
    { open = "{", close = "}" },
    { open = "<", close = ">" },
  },
}

-- TODO:
plugin("nvim-surround"):event_typing()
