if not nixCats "language.lua" then return end
---------------
----- LSP -----
---------------
lsp("lua_ls")
  :root_markers(
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".nvim.lua",
    ".git"
  )
  :settings {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      workspace = {
        --library = { vim.env.VIMRUNTIME },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
      formatters = {
        -- ignoreComments = true,
      },
      signatureHelp = { enabled = true },
      diagnostics = {
        -- globals = { "nixCats", "vim" },
        -- disable = { "missing-fields" },
      },
    },
  }
----------------
---- Linter ----
----------------
-- local function selene_configured(path)
--   return #vim.fs.find("selene.toml", { path = path, upward = true, type = "file" }) > 0
-- end
--
-- local lint = require "lint"
-- lint.linters_by_ft = {
--   lua = { "selene" },
-- }
-- lint.linters.selene = {
--   condition = function(ctx) return selene_configured(ctx.filename) end,
-- }
linter("lua", "selene")
-----------------
--- Formatter ---
-----------------
formatter("lua", "stylua")

-----------------
--- LazyDev ---
-----------------
local libs = {
  vim.env.VIMRUNTIME,
  { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  { path = (nixCats.nixCatsPath or "") .. "/lua", words = { "nixCats" } },
  "nvim-dap-ui",
}
local s = vim.split(cwd(), "/", { trimempty = true })
if s[#s] ~= "nvim" then table.insert(libs, (nixCats.configDir or "") .. "/lua/internal") end

plugin("lazydev"):ft("lua"):cmd("LazyDev"):opts {
  library = vim.list_extend(libs, {}),
  integrations = {
    cmp = false,
  },
}
