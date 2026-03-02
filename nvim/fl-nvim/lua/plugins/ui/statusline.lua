---@param ... string
local function not_ft(...)
  for _, ft in ipairs { ... } do
    if vim.bo.filetype == ft then return false end
  end
  return true
end

plugin("statuscol.nvim")
  :lazy(vim.fn.argc(-1) == 0) -- load immediately when opening a file from the cmdline
  :event_defer()
  :config(function()
    local builtin = require "statuscol.builtin"
    require("statuscol").setup {
      -- thousands = ",",
      relculright = true,
      segments = {
        {
          sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
          click = "v:lua.ScSa",
        },
        -- TODO:
        -- {
        --   text = { builtin.foldfunc, " " },
        --   click = "v:lua.ScFa",
        --   condition = { function() return not_ft "alpha" end, builtin.not_empty },
        -- },
        -- { text = { "%s" }, click = "v:lua.ScSa" },
        {
          sign = { text = { ".*" }, maxwidth = 1, colwidth = 2, auto = true },
          click = "v:lua.ScSa",
          condition = { function() return not (not_ft "oil") end },
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
          sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
          condition = { function() return not_ft "alpha" end, builtin.not_empty },
          click = "v:lua.ScLa",
        },
        {
          sign = { text = { "[┃_‾~┆]" }, maxwidth = 1, colwidth = 1, auto = false },
          click = "v:lua.ScSa",
        },
        -- {
        --   sign = { name = { ".*" }, maxwidth = 2, colwidth = 2, auto = true },
        --   click = "v:lua.ScSa",
        -- },
      },
      clickhandlers = {
        FoldOther = false,
      },
    }
  end)
