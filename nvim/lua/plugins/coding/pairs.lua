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
    -- ["html"] = {
    --   enable_close = false,
    -- },
  },
}

plugin("nvim-autopairs"):event_typing():opts {
  check_ts = true,
  -- enable_check_bracket_line = false
}

plugin("neotab"):event_typing():opts {
  behavior = "nested", ---@type ntab.behavior
  pairs = {
    { open = "(", close = ")" },
    { open = "[", close = "]" },
    { open = "{", close = "}" },
    { open = "'", close = "'" },
    { open = '"', close = '"' },
    { open = "`", close = "`" },
    { open = "<", close = ">" },
  },
  exclude = {},
  smart_punctuators = {
    enabled = true,
    semicolon = {
      enabled = true,
      ft = { "cs", "c", "cpp", "java" },
    },
    escape = {
      enabled = true,
      triggers = {
        ["+"] = {
          pairs = {
            { open = '"', close = '"' },
          },
          format = " %s ", -- " + "
          ft = { "java" },
        },
        [","] = {
          pairs = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
          },
          format = "%s ", -- ", "
        },
        ["="] = {
          pairs = {
            { open = "(", close = ")" },
          },
          ft = { "javascript", "typescript" },
          format = " %s> ", -- ` => `
          cond = "^$",
        },
      },
    },
  },
}

-- TODO:
plugin("nvim-surround"):event_defer()
