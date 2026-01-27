vim.api.nvim_set_hl(0, "ArrowBookmarkSign", {
  fg = "#94e2d5",
  bg = "NONE",
  bold = true,
})

vim.fn.sign_define("ArrowColMarker", { text = "󱡁 ", texthl = "ArrowBookmarkSign" })

vim.api.nvim_create_autocmd("User", {
  pattern = "ArrowMarkUpdate",
  callback = function()
    local persist = require "arrow.buffer_persist"
    local bufnr = vim.fn.bufnr()
    local marks = persist.get_bookmarks_by(vim.fn.bufnr())
    if marks then
      vim.fn.sign_unplace("ArrowBookmarkSign", { buffer = bufnr })
      for _, mark in ipairs(marks) do
        vim.fn.sign_place(0, "ArrowBookmarkSign", "ArrowColMarker", bufnr, { lnum = mark.line })
      end
    end
  end,
})
