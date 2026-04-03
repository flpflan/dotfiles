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
  callback = function() (vim.hl or vim.highlight).on_yank({ timeout = 100 }) end,
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

-- LSP Document Highlight
-- vim.cmd(
--   [[
--     augroup lsp_document_highlight
--       autocmd! * <buffer>
--       autocmd CursorHold,CursorHoldI  <buffer> lua vim.lsp.buf.document_highlight()
--       autocmd CursorMoved,CursorMovedI,BufLeave   <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]],
--   false
-- )

-- Disable auto-comment for new lines
vim.api.nvim_create_autocmd("FileType", {
  desc = "remove formatoptions",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Disable diagnostics for .env and .md files
local group = vim.api.nvim_create_augroup("__nofilediagnostics", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { ".env*", "*.md" },
  group = group,
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})

-- Automatic rooter
local ROOT_MARKERS = { ".git", ".nvim.lua" }
local EXRCS = { ".nvim.lua", ".nvimrc", ".exrc" }

local read_exrc = function(path)
  if vim.o.exrc == false then return end

  local exrc = vim.fs.find(EXRCS, {
    path = path,
    type = "file",
  })[1] -- string|nil
  if not exrc then return end

  if vim.secure.read(exrc) then vim.cmd.source(exrc) end
end

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("Rooter", {}),
  desc = "Find project root on BufEnter. cd there and try reading any exrc there.",
  callback = function()
    local cwd = vim.fn.getcwd()

    local root_marker = vim.fs.find(ROOT_MARKERS, {
      path = cwd,
      upward = true,
    })[1]

    if not root_marker then return end

    local root_dir = vim.fs.dirname(root_marker)

    vim.fn.chdir(root_dir)
    read_exrc(root_dir)
  end,
})
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspRooter", {}),
  desc = "Adopt lsp root_dir. cd there and try reading any exrc there.",
  callback = function()
    local root_dir
    for _, client in pairs(vim.lsp.get_clients { bufnr = vim.api.nvim_get_current_buf() }) do
      root_dir = client.config.root_dir
      if root_dir then break end
    end

    if not root_dir then return end

    vim.fn.chdir(root_dir)
    read_exrc(root_dir)
  end,
})
