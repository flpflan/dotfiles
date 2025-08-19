-- Restore Last Position
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds { group = lastplace }
vim.api.nvim_create_autocmd("BufReadPost", {
  group = lastplace,
  pattern = { "*" },
  desc = "remember last cursor place",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function() (vim.hl or vim.highlight).on_yank() end,
})

-- Auto Highlight Search
local mid_mapping = false
vim.on_key(function(char)
  if vim.fn.mode() == "n" and not mid_mapping then
    local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
    if vim.o.hlsearch ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
    mid_mapping = true
    vim.schedule(function() mid_mapping = false end)
  end
end)
