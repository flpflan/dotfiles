if not nixCats "language.bundles.frontend" then return end
---------------
----- LSP -----
---------------
-- lsp("biome"):cmd("biome", "lsp-proxy"):root_dir ""
--***** Typescript *****--
lsp "eslint"
-- TODO: plugin("typescript-tools")
local vtsls_default_ft = require("vtsls").lspconfig.default_config.filetypes
lsp("vtsls")
  :root_dir(function(bufnr, on_dir)
    local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock", "deno.lock" }
    root_markers = vim.fn.has "nvim-0.11.3" == 1 and { root_markers } or root_markers
    local project_root = vim.fs.root(bufnr, root_markers) or ""
    on_dir(project_root)
  end)
  :ft(unpack(vim.list_extend(vtsls_default_ft, { "vue" })))
  :settings {
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = true },
      },
    },
    javascript = {
      updateImportsOnFileMove = { enabled = "always" },
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = true },
      },
    },
    vtsls = {
      enableMoveToFileCodeAction = true,
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.fnamemodify(vim.fn.fnamemodify(vim.fn.exepath "vue-language-server", ":h"), ":h")
              .. "/lib/language-tools/packages/language-server",
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
    },
  }
--**** Css ****--
-- lsp "stylelint_lsp"
lsp "cssls"
--**** Html ****--
lsp "html"
--**** Vue ****--
local function join_path(...)
  local components = { ... }
  local separator = package.config:sub(1, 1)
  local result = {}
  for _, comp in ipairs(components) do
    if comp ~= "" then table.insert(result, comp) end
  end
  return "/" .. table.concat(result, separator)
end
vim.defer_fn(
  function()
    lsp("vue_ls"):settings {
      typescript = {
        tsdk = vim.fn.getcwd() .. join_path("node_modules", "typescript", "lib"),
      },
      vue = {
        codeLens = {
          references = true,
          pugReferences = true,
          scriptSetupSupport = true,
        },
      },
    }
  end,
  100
)
----------------
---- Linter ----
----------------
-----------------
--- Formatter ---
-----------------
-- formatter({ "css", "scss", "sass", "less", "graphql" }, "prettierd")
-----------------
--- Debugger ---
-----------------
for _, adapterType in ipairs { "node", "chrome", "msedge" } do
  local pwaType = "pwa-" .. adapterType
  local nativeAdapter = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "js-debug",
      args = { "${port}" },
    },
  }

  dap(pwaType, nativeAdapter)

  dap(adapterType, function(cb, config)
    config.type = pwaType
    if type(nativeAdapter) == "function" then
      nativeAdapter(cb, config)
    else
      cb(nativeAdapter)
    end
  end)
end
-----------------
---- Plugins ----
-----------------
plugin("ts-error-translator"):event_defer()
plugin("package-info.nvim"):event("BufRead package.json"):opts {
  package_manager = "bun",
}
