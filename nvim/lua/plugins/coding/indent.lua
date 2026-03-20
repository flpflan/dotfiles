plugin("guess-indent.nvim"):opts {
  filetype_exlude = {
    "netrw",
    "tutor",
    "oil",
  },
}

-- Treesitter based indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
