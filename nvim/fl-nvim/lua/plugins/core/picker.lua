plugin("snacks.nvim"):keys {
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
      "W",
      function()
        require("snacks").picker.grep {
          hidden = true,
          ignored = true,
        }
      end,
      "Find All Words"
    ),
    kmap("n", "w", function() require("snacks").picker.grep() end, "Find Words"),
    -- kmap("n", "t", function() require("snacks").picker.todo_comments() end, "Find TODOs"),
  }),
  kmap("n", "<leader><leader>", function() require("snacks").picker.buffers() end, "Show Buffers"),
  kgroup("<leader>b", "Buffer", {}, {
    kmap("n", "e", function() require("snacks").picker.buffers() end, "Buffer Explorer"),
    kmap("n", "C", function()
      local bufs = vim.api.nvim_list_bufs()
      local current_buf = vim.api.nvim_get_current_buf()
      for _, i in ipairs(bufs) do
        if i ~= current_buf then vim.api.nvim_buf_delete(i, {}) end
      end
    end, "Close All Other Buffers"),
  }),
}
