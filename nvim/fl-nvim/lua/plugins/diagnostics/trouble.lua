plugin("trouble.nvim"):cmd("Trouble"):keys {
  kgroup("<leader>x", "Quickfix/Lists", {}, {
    kmap("n", "x", kcmd "Trouble diagnostics toggle", "Trouble Document Diagnostics"),
    kmap("n", "X", kcmd "Trouble diagnostics toggle filter.buf=0", "Trouble Workspace Diagnostics"),
    kmap("n", "L", kcmd "Trouble loclist toggle", "Trouble Location List"),
    kmap("n", "Q", kcmd "Trouble quickfix toggle", "Trouble Quickfix List"),
    kmap("n", "t", kcmd "Trouble todo", "Trouble Todo"),
    kmap("n", "T", kcmd "Trouble todo filter={tag={TODO,FIX,FIXME}}", "Trouble Todo/Fix/Fixme"),
  }),
}
