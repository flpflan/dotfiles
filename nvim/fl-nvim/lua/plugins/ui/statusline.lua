plugin("statuscol.nvim"):config(function()
  local builtin = require "statuscol.builtin"
  require("statuscol").setup {
    -- thousands = ",",
    relculright = true,
    segments = {
      {
        sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
        click = "v:lua.ScSa",
      },
      {
        text = { builtin.foldfunc, " " },
        click = "v:lua.ScFa",
        condition = { true, builtin.not_empty },
      },
      -- { text = { "%s" }, click = "v:lua.ScSa" },
      {
        sign = { text = { ".*" }, maxwidth = 1, colwidth = 2, auto = true },
        click = "v:lua.ScSa",
        condition = { function() return vim.bo.filetype == "oil" end },
      },
      {
        text = {
          -- function(args, segments)
          --   local n = builtin.lnumfunc(args, segments)
          --   return vim.fn.substitute(n, " ", "", "g")
          -- end,
          builtin.lnumfunc,
          " ",
        },
        sign = { auto = true },
        condition = { true, builtin.not_empty },
        click = "v:lua.ScLa",
      },
      {
        sign = { text = { "[┃_‾~┆]" }, maxwidth = 1, colwidth = 1, auto = true },
        click = "v:lua.ScSa",
      },
      {
        sign = { name = { ".*" }, maxwidth = 2, colwidth = 2, auto = true },
        click = "v:lua.ScSa",
      },
    },
    clickhandlers = {
      FoldOther = false,
    },
  }
end)
