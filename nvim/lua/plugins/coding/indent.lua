plugin("guess-indent.nvim"):opts {
  filetype_exlude = {
    "netrw",
    "tutor",
    "oil",
  },
}

-- Treesitter based indentation
local exluded = { "cpp" }
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    if vim.tbl_contains(exluded, args.match) then
      return
    end
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
