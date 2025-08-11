require("lze").register_handlers(require("lzextras").merge)
require("lze").register_handlers(require("nixCatsUtils.lzUtils").for_cat)
-- require("lze").register_handlers(require("lzextras").lsp)
-- require("lze").h.lsp.set_ft_fallback(
--   function(name)
--     return dofile(nixCats.pawsible { "allPlugins", "opt", "nvim-lspconfig" } .. "/lsp/" .. name .. ".lua").filetypes
--       or {}
--   end
-- )
