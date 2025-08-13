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
    kmap("n", "<C-Right>", function() require("smart-splits").resize_right() end, "resize right"),
    kmap("n", "<C-Left>", function() require("smart-splits").resize_left() end, "resize left"),
    kmap("n", "<C-Up>", function() require("smart-splits").resize_up() end, "resize up"),
    kmap("n", "<C-Down>", function() require("smart-splits").resize_down() end, "resize down"),

    kmap("n", "<C-L>", function() require("smart-splits").move_cursor_right() end, "moving between splits to right"),
    kmap("n", "<C-H>", function() require("smart-splits").move_cursor_left() end, "moving between splits to left"),
    kmap("n", "<C-K>", function() require("smart-splits").move_cursor_up() end, "moving between splits to up"),
    kmap("n", "<C-J>", function() require("smart-splits").move_cursor_down() end, "moving between splits to down"),

    kmap("n", "<leader>o", function() require("smart-splits").move_cursor_previous() end, "Jump Between Splits"),
    -- TODO: swap buffer
    -- TODO: Kitty integration
  }
