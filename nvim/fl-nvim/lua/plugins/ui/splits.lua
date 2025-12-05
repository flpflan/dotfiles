plugin("smart-splits.nvim")
  :event_defer()
  :on_require("smart-splits")
  :opts({
    resize_mode = {
      silent = true,
      quit_key = "",
    },
  })
  :keys {
    kmap("n", "<C-Right>", klazy("smart-splits").resize_right(), "resize right"),
    kmap("n", "<C-Left>", klazy("smart-splits").resize_left(), "resize left"),
    kmap("n", "<C-Up>", klazy("smart-splits").resize_up(), "resize up"),
    kmap("n", "<C-Down>", klazy("smart-splits").resize_down(), "resize down"),

    kmap("n", "<C-L>", klazy("smart-splits").move_cursor_right(), "moving between splits to right"),
    kmap("n", "<C-H>", klazy("smart-splits").move_cursor_left(), "moving between splits to left"),
    kmap("n", "<C-K>", klazy("smart-splits").move_cursor_up(), "moving between splits to up"),
    kmap("n", "<C-J>", klazy("smart-splits").move_cursor_down(), "moving between splits to down"),

    kmap("n", "<leader>o", klazy("smart-splits").move_cursor_previous(), "Jump Between Splits"),
    -- TODO: swap buffer
    -- TODO: Kitty integration
  }
