plugin("Comment.nvim"):event_defer():keys {
  kmap(
    "n",
    "<leader>/",
    function()
      require("Comment.api").call("toggle.linewise." .. (vim.v.count == 0 and "current" or "count_repeat"), "g@$")()
    end,
    "Toggle Comment Line",
    { expr = true, silent = true }
  ),
  kmap(
    "x",
    "<leader>/",
    "<Esc><Cmd>lua require('Comment.api').locked('toggle.linewise')(vim.fn.visualmode())<CR>",
    "Toggle Comment"
  ),
}
