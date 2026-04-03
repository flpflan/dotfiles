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
  callback = function(args)
    if vim.tbl_contains(exluded, args.match) then return end

    local lang = vim.treesitter.language.get_lang(args.match)
    if lang and vim.treesitter.language.add(lang) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
