local function filterSwitch(severity_switch)
  return function(view)
    local f = view:get_filter "severity"
    local severity = (f and f.filter.severity or 0)
    if severity ~= severity_switch then
      severity = severity_switch
    else
      severity = 0
    end
    view:filter({ severity = severity }, {
      id = "severity",
      template = "{hl:Title}Filter:{hl} {severity}",
      del = severity == 0,
    })
  end
end

plugin("trouble.nvim")
  :cmd("Trouble")
  :keys({
    kgroup("<leader>x", "Quickfix/Lists", {}, {
      kmap("n", "x", kcmd "Trouble diagnostics toggle", "Trouble Document Diagnostics"),
      kmap("n", "X", kcmd "Trouble diagnostics toggle filter.buf=0", "Trouble Workspace Diagnostics"),
      kmap("n", "L", kcmd "Trouble loclist toggle", "Trouble Location List"),
      kmap("n", "Q", kcmd "Trouble quickfix toggle", "Trouble Quickfix List"),
      kmap("n", "t", kcmd "Trouble todo", "Trouble Todo"),
      kmap("n", "T", kcmd "Trouble todo filter={tag={TODO,FIX,FIXME}}", "Trouble Todo/Fix/Fixme"),
    }),
  })
  :opts {
    focus = true,
    auto_preview = false,
    keys = {
      ["<cr>"] = "jump_close",
      ["<Tab>"] = "preview",
      ["<C-e>"] = {
        action = filterSwitch(1),
        desc = "toggle errors",
      },
      ["<C-w>"] = {
        action = filterSwitch(2),
        desc = "toggle warnings",
      },
      ["<C-i>"] = {
        action = filterSwitch(3),
        desc = "toggle info",
      },
      ["<C-h>"] = {
        action = filterSwitch(4),
        desc = "toggle hints",
      },
    },
  }
