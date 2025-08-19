plugin("snacks.nvim")
  :opts({
    picker = { ui_select = false },
  })
  :keys {
    kgroup("<leader>f", "Find", {}, {
      kmap(
        "n",
        "f",
        function()
          require("snacks").picker.files {
            hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat ".git" or {}, "type") == "directory",
          }
        end,
        "Find Files"
      ),
      kmap(
        "n",
        "F",
        function()
          require("snacks").picker.files {
            hidden = true,
            ignored = true,
          }
        end,
        "Find All Files"
      ),
      kmap(
        "n",
        "F",
        function()
          require("snacks").picker.grep {
            hidden = true,
            ignored = true,
          }
        end,
        "Find All Words"
      ),
      kmap("n", "f", function() require("snacks").picker.grep() end, "Find Words"),
      -- kmap("n", "t", function() require("snacks").picker.todo_comments() end, "Find TODOs"),
    }),
    kgroup("<leader>b", "Buffer", {}, {
      kmap("n", "e", function() require("snacks").picker.buffers() end, "Buffer Explorer"),
    }),
  }
