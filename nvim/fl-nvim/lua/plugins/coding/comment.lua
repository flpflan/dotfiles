require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

plugin("comment.nvim")
  :on_require("Comment")
  :event_defer()
  :opts({ pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() })
  :keys {
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
