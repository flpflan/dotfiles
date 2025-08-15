-- plugin("mini.pairs"):event_defer():opts({
-- 	modes = { insert = true, command = true, terminal = false },
-- })

-- plugin("nvim-treesitter-endwise")

-- TODO:
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

plugin("ultimate-autopair.nvim"):event_typing()

require("tabout").setup {
  tabkey = "<Tab>",
  backwards_tabkey = "<S-Tab>",
  act_as_tab = true,
  act_as_shift_tab = false,
  default_tab = "<C-t>",
  default_shift_tab = "<C-d>",
  enable_backwards = true,
  completion = false,
  tabouts = {
    { open = "'", close = "'" },
    { open = '"', close = '"' },
    { open = "`", close = "`" },
    { open = "(", close = ")" },
    { open = "[", close = "]" },
    { open = "{", close = "}" },
  },
  ignore_beginning = true,
  exclude = {},
}

plugin("tabout.nvim"):event_typing():on_require("tabout"):opts({
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
})

plugin("nvim-surround"):event_typing()
