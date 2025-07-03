require("plugins.lazydev")
require("cmp").setup({
    source = {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
    }
})
local ok, _ = pcall(require, "mason")
if ok then
    require("mason").setup(
        {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    )
    require("mason-lspconfig").setup({
        automatic_installation = true,
    })
    require("mason-null-ls").setup({
        automatic_installation = true,
    })
end

-- TODO: Lazy load
require("langs.lua")
-- require("langs.json")
-- require("langs.toml")
require("langs.nix")

vim.keymap.set({ "n", "v" }, "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Code format" })
