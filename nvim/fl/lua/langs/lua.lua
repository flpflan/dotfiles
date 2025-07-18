local function selene_configured(path)
  return #vim.fs.find("selene.toml", { path = path, upward = true, type = "file" }) > 0
end
---------------
----- LSP -----
---------------
local lspconfig = require("lspconfig")

local opts = {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            workspace = {
                --library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

-- local success, blink = pcall(require, "blink.cmp")
-- if success then
--     local capabilities = blink.get_lsp_capabilities()
--     opts.capabilities = capabilities
-- end

lspconfig.lua_ls.setup(opts)
----------------
---- Linter ----
----------------
--local nlsconfig = require("mason-null-ls")
--nlsconfig.selene.setup({})
require("nvim-lint").setup({
    linters_by_ft = {
        lua = { "selene" }
    },
    linters = {
        selene = condition = function(ctx) return selene_configured(ctx.filename) end
    }
})
-----------------
--- Formatter ---
-----------------
--nlsconfig.stylua.setup({})
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" }
    }
})
