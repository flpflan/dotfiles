-- Treesitter based folds
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
    -- vim.wo.foldmethod = "syntax"
    -- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldcolumn = "0" -- Set to '0' to disable the fold column
    -- vim.o.foldcolumn = "auto:9"
    vim.wo.foldnestmax = 1
    vim.wo.foldminlines = 1
    vim.o.foldtext =
      [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' ... ' . '(' . (v:foldend - v:foldstart + 1) . ' lines)']]

    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    vim.cmd "highlight Folded ctermbg=NONE guibg=NONE"
    vim.cmd "highlight FoldColumn ctermfg=NONE guifg=NONE"
  end,
})

plugin("nvim-ufo"):event_defer():config(function()
  ---@diagnostic disable-next-line: unused-local
  require("ufo").setup {
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
    open_fold_hl_timeout = 150,
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" 󰁂 %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end,
  }
end)
