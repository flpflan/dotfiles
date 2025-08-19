-- TODO: Add the possibility for this to be triggered from the lsp definition
---@param client vim.lsp.Client
---@param buf integer
local function on_attach(client, buf)
  if client.name == "lua_ls" then
    require "neoconf"
  else
    if client.name == "ruff" then client.server_capabilities.hoverProvider = false end
  end
  if client.server_capabilities.inlayHintProvider then vim.lsp.inlay_hint.enable(true, {
    bufnr = buf,
  }) end
end

---@param buf integer
local function set_lsp_keymaps(buf)
  kopts({ buffer = buf }, {
    kmap({ "n" }, "K", vim.lsp.buf.hover, "Hover"),
    -- kmap({ "n" }, "gd", vim.lsp.buf.definition, "Goto Definition"),
    kmap({ "n" }, "gd", function() require("snacks").picker.lsp_definitions() end, "Goto Definition"),
    kmap({ "n" }, "gt", function() require("snacks").picker.lsp_type_definitions() end, "Goto Type Definition"),
    kmap({ "n" }, "gI", function() require("snacks").picker.lsp_implementations() end, "Goto Implementation"),
    kmap({ "n" }, "gr", function() require("snacks").picker.lsp_references() end, "Goto Reference"),
    kgroup("<leader>l", "Language Tools", {}, {
      kmap({ "n", "v" }, "a", vim.lsp.buf.code_action, "Code Actions"),
      kmap("n", "r", vim.lsp.buf.rename, "Rename"),
      kmap("n", "d", function()
        vim.diagnostic.open_float {
          border = "rounded",
          scope = "line",
          prefix = function(_, i, total)
            if total == 1 then return "", "" end
            return "(" .. i .. "/" .. total .. ") ", ""
          end,
          source = true,
        }
      end, "Diagnostic Float"),
    }),
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client ~= nil then
      on_attach(client, args.buf)
      set_lsp_keymaps(args.buf)
    end
  end,
})

vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grr")

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

vim.lsp.config("*", {
  root_markers = { ".git" },
})

vim.diagnostic.config {
  virtual_text = {
    enabled = true,
    prefix = "●",
  },

  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    header = "",
    prefix = "",
  },
  signs = {
    --support diagnostic severity / diagnostic type name
    text = {
      [vim.diagnostic.severity.ERROR] = Symbols.error,
      [vim.diagnostic.severity.WARN] = Symbols.warn,
      [vim.diagnostic.severity.HINT] = Symbols.hint,
      [vim.diagnostic.severity.INFO] = Symbols.info,
    },
  },
}

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "#db4b4b", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = "#e0af68", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticDeprecated", { fg = "#e0af68" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = "#0db9d7", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#0db9d7" })

kgroup("<leader>l", "Language Tools", {}, {
  kmap("n", "i", kcmd "LspInfo", "Lsp Info"),
  kmap("n", "R", function()
    local bufnr = vim.fn.bufnr()
    local clients = vim.lsp.get_clients { bufnr = bufnr }
    for _, client in ipairs(clients) do
      if client.name == "copilot" then goto continue end
      vim.lsp.stop_client(client.id, true)
      vim.defer_fn(
        function()
          vim.lsp.start(client.config, {
            bufnr = bufnr,
          })
        end,
        1000
      )
      ::continue::
    end
  end, "Restart Language Server"),
})
plugin("neoconf.nvim"):on_require("neoconf"):opts {
  import = {
    vscode = true,
    coc = false,
    nlsp = false,
  },
  plugins = {
    lspconfig = {
      enabled = false,
    },
    lua_ls = {
      enabled = true,
    },
  },
}
