kgroup("<leader>f", "Find", {}, {
  kmap(
    "n",
    "f",
    klazy("snacks.picker").files {
      hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat ".git" or {}, "type") == "directory",
    },
    "Find Files"
  ),
  kmap(
    "n",
    "F",
    klazy("snacks.picker").files {
      hidden = true,
      ignored = true,
    },
    "Find All Files"
  ),
  kmap(
    "n",
    "W",
    klazy("snacks.picker").grep {
      hidden = true,
      ignored = true,
    },
    "Find All Words"
  ),
  kmap("n", "w", klazy("snacks.picker").grep(), "Find Words"),
  -- kmap("n", "t", klazy("snacks.picker").todo_comments(), "Find TODOs"),
  kmap("n", "s", klazy("snacks.picker").lsp_symbols(), "Symbols"),
  kmap("n", "S", klazy("snacks.picker").lsp_workspace_symbols(), "Symbols (Workspace)"),
  kmap("n", "d", klazy("snacks.picker").diagnostics_buffer(), "Diagnostics (Buffer)"),
  kmap("n", "D", klazy("snacks.picker").diagnostics(), "Diagnostics"),
  kmap("n", "c", klazy("snacks.picker").commands(), "Commands"),
  kmap("n", "n", klazy("snacks.picker").noice(), "Notifications"),
  kmap("n", "u", klazy("snacks.picker").undo(), "Undo"),
  kmap("n", "t", klazy("snacks.picker").todo_comments { keywords = { "TODO", "FIX", "FIXME" } }, "Tags"),
})

kmap("n", "<leader><leader>", klazy("snacks.picker").buffers(), "Show Buffers")

kgroup("<leader>b", "Buffer", {}, {
  kmap("n", "e", klazy("snacks.picker").buffers(), "Buffer Explorer"),
  kmap("n", "C", function()
    local bufs = vim.api.nvim_list_bufs()
    local current_buf = vim.api.nvim_get_current_buf()
    for _, i in ipairs(bufs) do
      if i ~= current_buf then
        vim.api.nvim_buf_delete(i, {})
      end
    end
  end, "Close All Other Buffers"),
})
